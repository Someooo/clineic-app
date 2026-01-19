import 'package:flutter/material.dart';
import '../../../../core/widget/button/app_button.dart';
import '../../../../core/utils/color.dart';

class AddAppointmentButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final double? height;

  const AddAppointmentButton({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton.text(
      text: text ?? 'Add Appointment',
      onPressed: onPressed,
      color: color ?? AppColor.primaryColor,
      height: height ?? 48,
    );
  }
}
