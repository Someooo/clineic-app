class ApiPath {
  ApiPath._();

  // Base URL for API
  static const String baseUrl = 'http://192.168.1.52:8001';

  // Auth Endpoints
  static const String login = '/api/user/login';
  static const String register = '/auth/register-client';
  static const String logout = '/auth/logout';
  static const String getUser = '/auth/user';
  static const String profile = '/auth/profile';
}

