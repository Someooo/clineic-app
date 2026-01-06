class ApiPath {
  ApiPath._();

  // Base URL for API
  static const String baseUrl = 'https://clinic.code-pro.io';

  // Auth Endpoints
  static const String login = '/api/user/login';
  static const String register = '/api/user/register';
  static const String logout = '/auth/logout';
  static const String getUser = '/auth/user';
  static const String profile = '/auth/profile';
}

