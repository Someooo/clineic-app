import '../../../../global_imports.dart';

class AuthRegisterCase {
  final AuthRepository repository;

  AuthRegisterCase(this.repository);

  Future<Either<Failure, ApiResponse<AuthEntity>>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirmation,
    required int locationId,
    required CancelToken cancelToken,
  }) {
    return repository.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      locationId: locationId,
      cancelToken: cancelToken,
    );
  }
}
