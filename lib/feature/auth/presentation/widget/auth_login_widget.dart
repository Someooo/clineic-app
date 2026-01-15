import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/mixin/validate.mixin.dart';
import '../../../../core/utils/border_radius.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/widget/app_widget/custom_text_field.dart';
import '../cubit/auth_cubit.dart';
import 'auth_action_button.dart';
import 'auth_password_field.dart';

class AuthLoginWidget extends StatelessWidget with FormValidationMixin {
  AuthLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
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
                    // Welcome Text
                    Text(
                      t.login,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                      textAlign: Localizations.localeOf(context).languageCode == 'ar'
                          ? TextAlign.right 
                          : TextAlign.left,
                    ),
                    24.gap,
                    // Email Field
                    CustomTextField(
                      fillColor: Colors.grey.shade50,
                      customBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppBorderRadius.md12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      label: "${t.email} ",
                      controller: cubit.emailController,
                      hintText: "${t.enterEmailHint} ",
                      validator: validateEmailOrPhone,
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
                    24.gap,
                    // Login Button
                    AuthActionButton(
                      onTap: cubit.login,
                      text: t.login,
                    ),
                     20.gap,
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
