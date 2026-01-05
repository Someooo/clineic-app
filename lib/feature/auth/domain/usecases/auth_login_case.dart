import '../../../../global_imports.dart';

class AuthLoginCase {
  final AuthRepository repository;

  AuthLoginCase(this.repository);

  Future<Either<Failure, ApiResponse<AuthEntity>>> call({
    required String email,
    required String password,
    required CancelToken cancelToken,
  }) {
    return repository.login(
      email: email,
      password: password,
      cancelToken: cancelToken,
    );
  }
}
