import '../../../../global_imports.dart';
import '../../../../core/services/user_storage_service.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../domain/usecases/auth_login_case.dart';

/// Example Login Screen demonstrating complete login flow
/// with API call, user ID storage, and error handling
class ExampleLoginScreen extends StatefulWidget {
  const ExampleLoginScreen({super.key});

  @override
  State<ExampleLoginScreen> createState() => _ExampleLoginScreenState();
}

class _ExampleLoginScreenState extends State<ExampleLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isLoading = false;
  String? _error;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Get the login use case from dependency injection
      final loginCase = getIt<AuthLoginCase>();
      
      // Create cancel token for request cancellation
      final cancelToken = CancelToken();
      
      // Call login API
      final result = await loginCase(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        cancelToken: cancelToken,
      );

      await result.fold(
        (failure) {
          // Handle login failure
          setState(() {
            _error = failure.message;
          });
        },
        (apiResponse) async {
          if (apiResponse.hasError) {
            // Handle API error response
            setState(() {
              _error = apiResponse.description;
            });
          } else {
            // Login successful - user data is already saved by AuthRepository
            final user = apiResponse.data;
            final userId = UserStorageService.instance.getUserId();
            
            // Show success message and navigate
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Welcome ${user?.fullName ?? 'User'}!'),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 2),
                ),
              );
              
              // Navigate to home or booking screen
              // For example: context.go('/home');
              print('Login successful! User ID: $userId');
              print('User info: ${UserStorageService.instance.getUserInfo()}');
            }
          }
        },
      );
    } catch (e) {
      setState(() {
        _error = 'An unexpected error occurred: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showStoredUserInfo() {
    final userInfo = UserStorageService.instance.getUserInfo();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stored User Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: ${userInfo['userId'] ?? 'Not logged in'}'),
            const SizedBox(height: 8),
            Text('Email: ${userInfo['email'] ?? 'Not available'}'),
            const SizedBox(height: 8),
            Text('Name: ${userInfo['userName'] ?? 'Not available'}'),
            const SizedBox(height: 8),
            Text('Is Logged In: ${userInfo['isLoggedIn'] ?? false}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Login', style: AppTextStyle.headLine1),
        actions: [
          IconButton(
            onPressed: _showStoredUserInfo,
            icon: const Icon(Icons.info_outline),
            tooltip: 'Show Stored User Info',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColor.tealColor, AppColor.blueColor],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo or Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primaryColor.withOpacity(0.1),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: AppColor.primaryColor,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Title
                    Text(
                      'Welcome Back',
                      style: AppTextStyle.style24B.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue',
                      style: AppTextStyle.style14.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColor.primaryColor),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColor.primaryColor),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Error Message
                    if (_error != null) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColor.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: AppColor.red,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _error!,
                                style: AppTextStyle.style12.copyWith(
                                  color: AppColor.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Login Button
                    _isLoading
                        ? Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.white,
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                foregroundColor: AppColor.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Sign In',
                                style: AppTextStyle.style16B.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 16),

                    // Demo Info
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Demo Info:',
                            style: AppTextStyle.style12B.copyWith(
                              color: AppColor.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'After successful login, the user ID will be stored and can be used in booking requests.',
                            style: AppTextStyle.style12.copyWith(
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
