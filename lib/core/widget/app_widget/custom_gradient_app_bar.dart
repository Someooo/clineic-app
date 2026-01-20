import 'package:flutter/material.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';

class CustomGradientAppBar extends StatelessWidget {
  final String title;
  final Widget? icon;
  final VoidCallback? onIconPressed;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final double? elevation;
  final double? toolbarHeight;

  const CustomGradientAppBar({
    super.key,
    required this.title,
    this.icon,
    this.onIconPressed,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.elevation,
    this.toolbarHeight,
  });

  factory CustomGradientAppBar.withDrawer({
    required String title,
    Widget? icon,
    VoidCallback? onDrawerPressed,
  }) {
    return CustomGradientAppBar(
      title: title,
      icon: icon,
      onIconPressed: onDrawerPressed ?? () {
        // Default behavior - open drawer
        // This will be handled by the Builder widget in the build method
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColor.tealColor, AppColor.blueColor],
        ),
      ),
      child: Column(
        children: [
          // Teal Header Section
          Container(
            width: double.infinity,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: AppTextStyle.style24B.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (leading != null) leading!,
                        if (icon != null)
                          Builder(
                            builder: (context) => IconButton(
                              onPressed: onIconPressed ?? () {
                                if (onIconPressed == null && 
                                    icon is Icon && 
                                    (icon as Icon).icon == Icons.grid_view) {
                                  Scaffold.of(context).openDrawer();
                                }
                              },
                              icon: icon!,
                            ),
                          ),
                        if (actions != null) ...actions!,
                      ],
                    ),
                    20.gap,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
