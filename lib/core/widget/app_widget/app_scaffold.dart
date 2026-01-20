import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color.dart';
import '../../utils/text_style.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool showAppBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final Gradient? gradient;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final VoidCallback? onBackPressed;

  const AppScaffold({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.showBackButton = true,
    this.showAppBar = true,
    this.resizeToAvoidBottomInset = true,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.backgroundColor,
    this.gradient,
    this.appBar,
    this.endDrawer,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradient != null
          ? null
          : (backgroundColor ?? AppColor.backgroundColor),
      drawerScrimColor: Colors.white.withOpacity(0.9),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar ??
          (showAppBar
              ? AppBar(
                  title: titleWidget != null
                      ? titleWidget!
                      : title != null
                          ? Text(
                              title!,
                              style: AppTextStyle.headLine1.copyWith(
                                color: Colors.black,
                              ),
                            )
                          : null,
                  centerTitle: true,
                  actions: actions,
                  automaticallyImplyLeading: showBackButton,
                  backgroundColor: Colors.transparent,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.light,
                  ),
                  leading: showBackButton
                      ? InkWell(
                          onTap: onBackPressed ?? () => context.pop(),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                          ),
                        )
                      : null,
                )
              : null),
      body: gradient != null
          ? Container(
              decoration: BoxDecoration(gradient: gradient),
              child: body,
            )
          : body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      endDrawer: endDrawer,
    );
  }
}

