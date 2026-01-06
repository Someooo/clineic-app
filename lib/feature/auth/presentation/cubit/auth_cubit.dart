import '../../../../global_imports.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with CubitLifecycleMixin<AuthState> {
  final AuthRegisterCase _register;
  final AuthLogoutCase _logout;
  final AuthLoginCase _login;
  final AuthGetUserCase _getUser;

  // final AuthUpdateProfileCase _updateProfile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  int? locationId;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthCubit({
    required AuthRegisterCase registerCase,
    required AuthLogoutCase logoutCase,
    required AuthLoginCase loginCase,
    required AuthGetUserCase getUserCase,
    // required AuthUpdateProfileCase updateProfileCase,
  }) : _register = registerCase,
       _logout = logoutCase,
       _login = loginCase,
       _getUser = getUserCase,
       // _updateProfile = updateProfileCase,
       super(const AuthState.initial());

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    safeEmit(const AuthState.loading());
    final result = await _login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      cancelToken: cancelToken,
    );
    if (isClosed) return;
    result.fold(
      (failure) => safeEmit(AuthState.error(message: failure.message)),
      (response) {
        // On successful login, just navigate to home without fetching user data
        if (response.token != null) {
          _reset();
          safeEmit(AuthState.loginSuccess(response.description));
        } else {
          safeEmit(AuthState.error(message: response.description));
        }
      },
    );
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    
    // Validate location_id is selected
    if (locationId == null) {
      safeEmit(AuthState.error(message: "Please select a location"));
      return;
    }
    
    safeEmit(const AuthState.loading());
    final result = await _register(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      passwordConfirmation: passwordConfirmationController.text.trim(),
      locationId: locationId!,
      cancelToken: cancelToken,
    );
    if (isClosed) return;
    result.fold(
      (failure) => safeEmit(
        AuthState.error(message: failure.message, title: failure.title),
      ),
      (response) {
        // If token is returned, save it and navigate (similar to login)
        if (response.token != null) {
          _reset();
          safeEmit(AuthState.loginSuccess(response.description));
        } else if (response.data != null) {
          _reset();
          safeEmit(AuthState.loaded(response.data!, response.description));
        } else {
          // Registration successful but no user data returned
          _reset();
          safeEmit(AuthState.loginSuccess(response.description));
        }
      },
    );
  }

  Future<void> logout() async {
    safeEmit(const AuthState.loading());
    final result = await _logout(cancelToken);
    if (isClosed) return;
    result.fold(
      (failure) => safeEmit(
        AuthState.error(message: failure.message, title: failure.title),
      ),
      (response) {
        // emit(AuthState.loaded(response.data!, response.message));
      },
    );
  }

  void _reset() {
    safeEmit(const AuthState.initial());
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    userNameController.clear();
    firstNameController.clear();
    lastNameController.clear();
    passwordConfirmationController.clear();
    locationId = null;
  }

  Future<void> getUser() async {
    safeEmit(const AuthState.loading());
    final result = await _getUser(cancelToken: cancelToken);
    if (isClosed) return;
    result.fold(
      (failure) => safeEmit(AuthState.error(message: failure.message)),
      (user) {
        safeEmit(AuthState.loaded(user.data!, ''));
      },
    );
  }

  @override
  close() async {
    super.close();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordConfirmationController.dispose();
  }
}
