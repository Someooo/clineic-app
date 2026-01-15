import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

import '../../../../core/utils/border_radius.dart';
import '../../../../core/widget/app_widget/custom_text_field.dart';
import '../cubit/password_visibility_cubit.dart';

class AuthPasswordField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const AuthPasswordField({super.key, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocBuilder<PasswordVisibilityCubit, bool>(
      builder: (context, isVisible) {
        return CustomTextField(
          controller: controller,
          fillColor: Colors.grey.shade50,
          customBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.md12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          label: t.password,
          hintText: t.enterPasswordHint,
          obscureText: !isVisible,
          suffixIconAssetName:
              isVisible ? Icons.visibility : Icons.visibility_off,
          onTapSuffix: () {
            context.read<PasswordVisibilityCubit>().toggleVisibility();
          },
          validator: validator,
          contentVerticalPadding: 16.0,
        );
      },
    );
  }
}
