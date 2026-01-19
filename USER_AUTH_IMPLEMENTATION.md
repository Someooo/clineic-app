# User Authentication & Booking Integration

This document explains the complete implementation of user authentication with patient ID storage and integration with booking requests.

## Overview

The implementation provides:
1. **Login API call** with proper error handling
2. **User ID storage** using SharedPreferences
3. **Booking requests** that use the stored patient_id
4. **Complete error handling** and success responses

## Architecture

### 1. UserStorageService
**Location**: `lib/core/services/user_storage_service.dart`

A singleton service that handles user data persistence using SharedPreferences:

```dart
// Save user info after login
await UserStorageService.instance.saveUserInfo(
  userId: user.id,
  email: user.email,
  userName: user.fullName,
);

// Get user ID for booking requests
final patientId = UserStorageService.instance.getUserId();

// Check if user is logged in
final isLoggedIn = UserStorageService.instance.isUserLoggedIn();
```

**Key Features**:
- Thread-safe singleton pattern
- Stores user ID, email, and name
- Provides login status checking
- Automatic cleanup on logout

### 2. AuthRepository Integration
**Location**: `lib/feature/auth/data/repository/auth_repository_impl.dart`

Updated to save user data to SharedPreferences after successful login:

```dart
if (!apiResponse.hasError && apiResponse.token != null) {
  await local.saveToken(apiResponse.token!);

  if (apiResponse.data != null) {
    await local.saveUser(apiResponse.data!);
    
    // Save user ID to SharedPreferences for easy access in booking requests
    await UserStorageService.instance.saveUserInfo(
      userId: apiResponse.data!.id,
      email: apiResponse.data!.email,
      userName: apiResponse.data!.fullName,
    );
  }
}
```

### 3. Booking Form Integration
**Location**: `lib/feature/appointment/presentation/pages/booking_form_screen.dart`

Updated to use patient_id from stored user data:

```dart
// Get patient ID from stored user data
final patientId = UserStorageService.instance.getUserId();
if (patientId == null) {
  setState(() {
    _error = 'User not logged in. Please login first.';
  });
  return;
}

// Use in booking request
final response = await _apiServices.postData(
  '/api/v1/appointmentBooking',
  {
    'patient': 'self',
    'hospital': widget.hospitalId,
    'doctor_id': widget.doctorId,
    'patient_id': patientId, // Use actual patient ID from stored user data
    'time': _formatTime(_selectedTime!),
    'date': _formatDate(_selectedDate!),
    'comments': _commentsController.text.trim(),
  },
);
```

## Usage Examples

### 1. Login Flow

```dart
// In your login screen
final loginCase = getIt<AuthLoginCase>();
final result = await loginCase(
  email: email,
  password: password,
  cancelToken: cancelToken,
);

await result.fold(
  (failure) {
    // Handle login failure
    print('Login failed: ${failure.message}');
  },
  (apiResponse) async {
    if (!apiResponse.hasError) {
      // User data is automatically saved to SharedPreferences
      final userId = UserStorageService.instance.getUserId();
      print('Login successful! User ID: $userId');
      
      // Navigate to booking screen
      Navigator.pushReplacementNamed(context, '/booking');
    }
  },
);
```

### 2. Booking Request

```dart
// In your booking form
final patientId = UserStorageService.instance.getUserId();
if (patientId == null) {
  // User not logged in, redirect to login
  Navigator.pushReplacementNamed(context, '/login');
  return;
}

final bookingData = {
  "patient": "self",
  "hospital": hospitalId,
  "doctor_id": doctorId,
  "patient_id": patientId, // This comes from SharedPreferences
  "time": "10:00",
  "date": "2026-01-19",
  "comments": "Regular checkup"
};

final response = await apiServices.postData(
  '/api/v1/appointmentBooking',
  bookingData,
);
```

### 3. Logout Flow

```dart
// UserStorageService automatically clears data on logout
// This is handled in AuthRepositoryImpl.logout()
await UserStorageService.instance.clearUserData();
```

## API Response Format

### Login API Response
```json
{
  "status": "success",
  "message": "Login successful",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "user": {
      "id": 7,
      "first_name": "John",
      "last_name": "Doe",
      "email": "john@example.com",
      "full_name": "John Doe"
    }
  }
}
```

### Booking API Request
```json
{
  "patient": "self",
  "hospital": 2,
  "doctor_id": 4,
  "patient_id": 7,  // This comes from stored user data
  "time": "10:00",
  "date": "2026-01-19",
  "comments": "Regular checkup"
}
```

## Error Handling

### Login Errors
- Network connectivity issues
- Invalid credentials
- Server errors
- Timeout handling with fallback to local data

### Booking Errors
- User not logged in
- Invalid date/time selection
- Doctor availability issues
- Network errors

## Initialization

### Main.dart Setup
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await EnvConstant.init();
    await HiveServices().init();
    await UserStorageService.init(); // Initialize UserStorageService
    await initGetIt();
    await getIt<AppServices>().initAppServices();
    HttpOverrides.global = MyHttpOverrides();
    Bloc.observer = AppBlocObserver();
  } catch (e) {
    logger.e("Init error: $e");
  }

  runApp(const MyApp());
}
```

## Key Benefits

1. **Automatic User ID Management**: No need to manually pass user ID between screens
2. **Persistent Storage**: User data survives app restarts
3. **Error Handling**: Comprehensive error handling for all scenarios
4. **Clean Architecture**: Separation of concerns with proper layering
5. **Type Safety**: Full type safety with Dart's strong typing
6. **Testability**: Easy to unit test with dependency injection

## Files Modified/Created

### New Files
- `lib/core/services/user_storage_service.dart` - User data persistence service
- `lib/feature/auth/presentation/pages/example_login_screen.dart` - Complete login example

### Modified Files
- `lib/core/constant/box_key.dart` - Added SharedPreferences keys
- `lib/feature/auth/data/repository/auth_repository_impl.dart` - Added SharedPreferences integration
- `lib/feature/appointment/presentation/pages/booking_form_screen.dart` - Added patient_id retrieval
- `lib/main.dart` - Added UserStorageService initialization

## Testing

The implementation is designed to be easily testable:

```dart
// Mock UserStorageService for testing
class MockUserStorageService extends Mock implements UserStorageService {
  @override
  int? getUserId() => 123; // Mock user ID
}

// Test booking with mock user
test('booking uses correct patient ID', () async {
  final mockService = MockUserStorageService();
  when(mockService.getUserId()).thenReturn(123);
  
  // Test booking logic
  final patientId = mockService.getUserId();
  expect(patientId, equals(123));
});
```

## Security Considerations

1. **SharedPreferences**: Stores data in plain text - suitable for non-sensitive data like user ID
2. **Secure Storage**: Tokens and sensitive data still use FlutterSecureStorage
3. **Token Management**: JWT tokens are handled securely with proper storage and refresh

## Future Enhancements

1. **Biometric Authentication**: Add fingerprint/face ID support
2. **Session Management**: Implement token refresh and session timeout
3. **Offline Support**: Cache booking requests for offline sync
4. **Multi-user Support**: Support multiple user profiles

This implementation provides a robust, scalable solution for user authentication and booking integration in your Flutter clinic app.
