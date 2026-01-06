import '../../../../global_imports.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.remote,
    required this.local,
  });

  @override
  Future<Either<Failure, ApiResponse<AuthEntity>>> getUser({
    required DataSource dataSource,
    required CancelToken cancelToken,
  }) async {
    try {
      final token = await local.getToken();
      if (token == null) {
        return left(ServerFailure(message: AppStrings.unauthorized.tr()));
      }
      final hasConnection = await networkInfo.isConnected;

      if (!hasConnection || dataSource == DataSource.local) {
        final user = await local.getUser();
        if (user != null) {
          return right(
            ApiResponse(description: '', code: 200, data: user.toEntity()),
          );
        }
      }
      final apiResponse = await remote.getUser(
        token: token,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError) {
        final entityResponse = apiResponse.map((model) => model.toEntity());

        await local.saveUser(apiResponse.data!);
        return right(entityResponse);
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } on DioException catch (e, t) {
      if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        final localModel = await local.getUser();
        if (localModel != null) {
          return right(
            ApiResponse(description: '', code: 200, data: localModel.toEntity()),
          );
        }
        return left(
          ServerFailure(
            message: "Request timed out, and no local data is available.",
          ),
        );
      }
      return handleRepoDataError(e, t);
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }

  @override
  Future<Either<Failure, ApiResponse<AuthEntity>>> login({
    required String email,
    required String password,
    required CancelToken cancelToken,
  }) async {
    try {
      final apiResponse = await remote.login(
        email: email,
        password: password,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.token != null) {
        // Save the token
        await local.saveToken(apiResponse.token!);
        
        // Since login response only contains token (no user data),
        // we return a response with null data but with the token saved
        // The cubit will need to handle this case or fetch user data separately
        final entityResponse = ApiResponse<AuthEntity>(
          hasError: false,
          description: apiResponse.description,
          code: apiResponse.code,
          token: apiResponse.token,
          data: null, // No user data in login response
        );

        return right(entityResponse);
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }

  @override
  Future<Either<Failure, ApiResponse<AuthEntity>>> logout(
    CancelToken cancelToken,
  ) async {
    try {
      final token = await local.getToken();
      if (token == null) {
        return left(ServerFailure(message: AppStrings.unauthorized.tr()));
      }
      final apiResponse = await remote.logout(
        token: token,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError) {
        await local.deleteToken();
        await local.deleteUser();
        final entityResponse = apiResponse.map((model) => model.toEntity());

        return right(entityResponse);
      } else {
        return left(
          ServerFailure(message: apiResponse.description, title: apiResponse.error),
        );
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> updateProfile(CancelToken cancelToken) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ApiResponse<AuthEntity>>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirmation,
    required int locationId,
    required CancelToken cancelToken,
  }) async {
    try {
      final apiResponse = await remote.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        locationId: locationId,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.token != null) {
        // Save the token
        await local.saveToken(apiResponse.token!);
        
        // Save user data if available
        if (apiResponse.data != null) {
          await local.saveUser(apiResponse.data!);
        }
        
        // Since register response only contains token (no user data),
        // we return a response with null data but with the token saved
        final entityResponse = ApiResponse<AuthEntity>(
          hasError: false,
          description: apiResponse.description,
          code: apiResponse.code,
          token: apiResponse.token,
          data: apiResponse.data != null 
              ? apiResponse.data!.toEntity() 
              : null, // No user data in register response
        );

        return right(entityResponse);
      } else {
        return left(
          ServerFailure(
            message: apiResponse.description,
            title: apiResponse.error,
          ),
        );
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }
}
