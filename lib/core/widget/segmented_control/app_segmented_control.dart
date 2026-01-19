import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color.dart';

class AppSegmentedControl<T extends Object> extends StatelessWidget {
  final Map<T, Widget> children;
  final T groupValue;
  final ValueChanged<T?>? onValueChanged;
  final Color? backgroundColor;
  final Color? thumbColor;
  final EdgeInsetsGeometry? padding;
  final double? height;

  const AppSegmentedControl({
    super.key,
    required this.children,
    required this.groupValue,
    this.onValueChanged,
    this.backgroundColor,
    this.thumbColor,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 32,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoSlidingSegmentedControl<T>(
        groupValue: groupValue,
        onValueChanged: (T? value) => onValueChanged?.call(value),
        backgroundColor: Colors.transparent,
        thumbColor: thumbColor ?? AppColor.white,
        children: children,
      ),
    );
  }
}
