import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/border_radius.dart';
import '../../../../core/widget/app_widget/custom_text_field.dart';
import '../../../../global_imports.dart';
import '../cubit/profile_settings_cubit.dart';
import '../cubit/profile_settings_state.dart';

/// Profile Settings Screen
/// 
/// Displays and allows editing of user profile settings:
/// - First Name (TextField)
/// - Last Name (TextField)
/// - Email (TextField)
/// - Phone Number (TextField)
/// - Notification Preferences (Switch)
/// 
/// Data Source:
/// - Loads from: GET /v1/profile/setting API (via ProfileSettingsCubit)
/// - Saves to: POST /v1/profile/store_profile_setting API (via ProfileSettingsCubit)
/// - Token: Retrieved from local storage (saved after login)
class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  // TextEditingControllers for form fields
  // These hold the user input values
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  // Switch state for notification preferences
  bool _notificationPreferences = false;

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileSettingsCubit>()..loadProfileSettings(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Settings'),
          backgroundColor: AppColor.backgroundColor,
        ),
        body: BlocListener<ProfileSettingsCubit, ProfileSettingsState>(
          listener: (context, state) {
            // Handle state changes
            if (state.isSuccess) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Profile settings saved successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state.errorMessage != null) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            }

            // Update form fields when settings are loaded
            if (state.settings != null && !state.isLoading) {
              final settings = state.settings!;
              // Update controllers with data from API response
              // Data source: ProfileSettingsState.settings (from GET /v1/profile/setting)
              _firstNameController.text = settings.firstName ?? '';
              _lastNameController.text = settings.lastName ?? '';
              _emailController.text = settings.email ?? '';
              _phoneNumberController.text = settings.phoneNumber ?? '';
              _notificationPreferences = settings.notificationPreferences;
            }
          },
          child: BlocBuilder<ProfileSettingsCubit, ProfileSettingsState>(
            builder: (context, state) {
              if (state.isLoading && state.settings == null) {
                // Initial loading
                return const Center(child: CircularProgressIndicator());
              }

              return _buildForm(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, ProfileSettingsState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                // Text(
                //   'Profile Settings',
                //   style: const TextStyle(
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //     color: AppColor.black,
                //   ),
                //   textAlign: context.locale.languageCode == 'ar'
                //       ? TextAlign.right
                //       : TextAlign.left,
                // ),
                // 24.gap,
          
                // First Name Field
                // Data source: _firstNameController.text (user input)
                // Saved to: POST /v1/profile/store_profile_setting with "first_name" field
                CustomTextField(
                  fillColor: Colors.grey.shade50,
                  customBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  label: 'First Name',
                  controller: _firstNameController,
                  hintText: 'Enter your first name',
                  prefixIconAssetName: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'First name is required';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  contentVerticalPadding: 16.0,
                ),
                16.gap,
          
                // Last Name Field
                // Data source: _lastNameController.text (user input)
                // Saved to: POST /v1/profile/store_profile_setting with "last_name" field
                CustomTextField(
                  fillColor: Colors.grey.shade50,
                  customBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  label: 'Last Name',
                  controller: _lastNameController,
                  hintText: 'Enter your last name',
                  prefixIconAssetName: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Last name is required';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  contentVerticalPadding: 16.0,
                ),
                16.gap,
          
                // Email Field
                // Data source: _emailController.text (user input)
                // Saved to: POST /v1/profile/store_profile_setting with "email" field
                CustomTextField(
                  fillColor: Colors.grey.shade50,
                  customBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  label: 'Email',
                  controller: _emailController,
                  hintText: 'Enter your email',
                  prefixIconAssetName: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  contentVerticalPadding: 16.0,
                ),
                16.gap,
          
                // Phone Number Field
                // Data source: _phoneNumberController.text (user input)
                // Saved to: POST /v1/profile/store_profile_setting with "phone_number" field
                CustomTextField(
                  fillColor: Colors.grey.shade50,
                  customBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  label: 'Phone Number',
                  controller: _phoneNumberController,
                  hintText: 'Enter your phone number',
                  prefixIconAssetName: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  contentVerticalPadding: 16.0,
                ),
                24.gap,
          
                // Notification Preferences Switch
                // Data source: _notificationPreferences (Switch state)
                // Saved to: POST /v1/profile/store_profile_setting with "notification_preferences" field
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Notification Preferences',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Enable push notifications',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _notificationPreferences,
                        onChanged: (value) {
                          setState(() {
                            _notificationPreferences = value;
                          });
                        },
                        activeTrackColor: AppColor.primaryColor.withOpacity(0.5),
                        activeColor: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ),
                24.gap,
          
                // Save Button - Using same style as login button
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColor.tealColor, AppColor.blueColor],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(AppBorderRadius.sm8),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppBorderRadius.sm8),
                        onTap: state.isLoading
                            ? null
                            : () {
                                // Validate form
                                if (_formKey.currentState!.validate()) {
                                  // Save profile settings
                                  // Calls: POST /v1/profile/store_profile_setting
                                  // Data sent: first_name, last_name, email, phone_number, notification_preferences
                                  context
                                      .read<ProfileSettingsCubit>()
                                      .saveProfileSettings(
                                        firstName: _firstNameController.text.trim(),
                                        lastName: _lastNameController.text.trim(),
                                        email: _emailController.text.trim(),
                                        phoneNumber:
                                            _phoneNumberController.text.trim(),
                                        notificationPreferences:
                                            _notificationPreferences,
                                      );
                                }
                              },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          alignment: Alignment.center,
                          child: state.isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColor.white),
                                  ),
                                )
                              : const Text(
                                  'Save Settings',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

