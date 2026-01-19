import 'package:shared_preferences/shared_preferences.dart';
import '../constant/box_key.dart';

/// Service for storing and retrieving user data using SharedPreferences
/// This service handles the user ID and other user-related data that needs
/// to persist across app sessions
class UserStorageService {
  static UserStorageService? _instance;
  static SharedPreferences? _preferences;

  UserStorageService._();

  /// Get singleton instance of UserStorageService
  static UserStorageService get instance {
    _instance ??= UserStorageService._();
    return _instance!;
  }

  /// Initialize the service (call this in main.dart before using the service)
  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  /// Save user ID to local storage
  Future<void> saveUserId(int userId) async {
    await _preferences?.setInt(BoxKey.userIdKey, userId);
  }

  /// Get user ID from local storage
  /// Returns null if no user ID is stored
  int? getUserId() {
    return _preferences?.getInt(BoxKey.userIdKey);
  }

  /// Check if user is logged in (has a stored user ID)
  bool isUserLoggedIn() {
    return getUserId() != null;
  }

  /// Clear all user data from local storage
  Future<void> clearUserData() async {
    await _preferences?.remove(BoxKey.userIdKey);
  }

  /// Save user email for reference
  Future<void> saveUserEmail(String email) async {
    await _preferences?.setString(BoxKey.userEmailKey, email);
  }

  /// Get user email from local storage
  String? getUserEmail() {
    return _preferences?.getString(BoxKey.userEmailKey);
  }

  /// Save user full name
  Future<void> saveUserName(String userName) async {
    await _preferences?.setString(BoxKey.userNameKey, userName);
  }

  /// Get user full name from local storage
  String? getUserName() {
    return _preferences?.getString(BoxKey.userNameKey);
  }

  /// Save complete user information at once
  Future<void> saveUserInfo({
    required int userId,
    String? email,
    String? userName,
  }) async {
    await saveUserId(userId);
    if (email != null) await saveUserEmail(email);
    if (userName != null) await saveUserName(userName);
  }

  /// Get all user information
  Map<String, dynamic> getUserInfo() {
    return {
      'userId': getUserId(),
      'email': getUserEmail(),
      'userName': getUserName(),
      'isLoggedIn': isUserLoggedIn(),
    };
  }
}
