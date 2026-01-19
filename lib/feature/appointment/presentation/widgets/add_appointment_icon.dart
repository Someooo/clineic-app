import 'package:flutter/material.dart';
import '../../../../core/utils/color.dart';

class AddAppointmentIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? iconSize;
  final Color? iconColor;

  const AddAppointmentIcon({
    super.key,
    this.onPressed,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.add_circle_outline,
        color: iconColor ?? AppColor.white,
        size: iconSize ?? 28,
      ),
    );
  }
}
