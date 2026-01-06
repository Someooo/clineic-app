import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/routes.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/mixin/validate.mixin.dart';
import '../../../../core/utils/border_radius.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/widget/app_widget/custom_text_field.dart';
import '../../../../core/widget/dropdown/drop_down_list.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/password_visibility_cubit.dart';
import 'auth_action_button.dart';
import 'auth_password_field.dart';

class AuthRegisterWidget extends StatelessWidget with FormValidationMixin {
  AuthRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Container(
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    Center(
                      child: Image.asset(
                        AppAssets.imagesPlayStore512Alt,
                        height: 120,
                        width: 120,
                      ),
                    ),
                    24.gap,
                    // Register Text
                    Text(
                      AppStrings.register.tr(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                      textAlign: context.locale.languageCode == 'ar' 
                          ? TextAlign.right 
                          : TextAlign.left,
                    ),
                    24.gap,
                    // First Name Field
                    CustomTextField(
                      fillColor: Colors.grey.shade50,
                      customBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      label: "First Name",
                      controller: cubit.firstNameController,
                      hintText: "Enter your first name",
                      validator: (val) {
                        return validateLength(value: val, minLength: 2, maxLength: 50);
                      },
                      contentVerticalPadding: 16.0,
                    ),
                    16.gap,
                    // Last Name Field
                    CustomTextField(
                      fillColor: Colors.grey.shade50,
                      customBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      label: "Last Name",
                      controller: cubit.lastNameController,
                      hintText: "Enter your last name",
                      validator: (val) {
                        return validateLength(value: val, minLength: 2, maxLength: 50);
                      },
                      contentVerticalPadding: 16.0,
                    ),
                    16.gap,
                    // Email Field
                    CustomTextField(
                      fillColor: Colors.grey.shade50,
                      customBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      label: "${AppStrings.email.tr()} ",
                      controller: cubit.emailController,
                      hintText: "${AppStrings.enterEmailHint.tr()} ",
                      validator: validateEmail,
                      contentVerticalPadding: 16.0,
                    ),
                    16.gap,
                    // Password Field
                    AuthPasswordField(
                      controller: cubit.passwordController,
                      validator: (val) {
                        return validateLength(value: val, minLength: 5, maxLength: 20);
                      },
                    ),
                    16.gap,
                    // Password Confirmation Field
                    BlocBuilder<PasswordVisibilityCubit, bool>(
                      builder: (context, isVisible) {
                        return CustomTextField(
                          controller: cubit.passwordConfirmationController,
                          fillColor: Colors.grey.shade50,
                          customBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          label: "Confirm Password",
                          hintText: "Confirm your password",
                          obscureText: !isVisible,
                          suffixIconAssetName:
                              isVisible ? Icons.visibility : Icons.visibility_off,
                          onTapSuffix: () {
                            context.read<PasswordVisibilityCubit>().toggleVisibility();
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please confirm your password";
                            }
                            if (val != cubit.passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                          contentVerticalPadding: 16.0,
                        );
                      },
                    ),
                    16.gap,
                    // Location ID Dropdown
                    AppDropDownList<int>(
                      labelText: "Location",
                      value: cubit.locationId,
                      onChangeTap: (value) {
                        cubit.locationId = value;
                      },
                      items: const [
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text("Location 1"),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text("Location 2"),
                        ),
                        DropdownMenuItem<int>(
                          value: 3,
                          child: Text("Location 3"),
                        ),
                      ],
                      validator: (val) {
                        if (val == null) {
                          return "Please select a location";
                        }
                        return null;
                      },
                    ),
                    24.gap,
                    // Register Button
                    AuthActionButton(
                      onTap: cubit.register,
                      text: AppStrings.register.tr(),
                      showRegisterLink: false,
                    ),
                    16.gap,
                    // Back to Login Link
                    GestureDetector(
                      onTap: () {
                        context.go(AppRoutes.login);
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: AppStrings.doYouHaveAccount.tr()),
                            TextSpan(
                              text: " ${AppStrings.login.tr()}",
                              style: const TextStyle(
                                color: AppColor.blueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    16.gap,
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
