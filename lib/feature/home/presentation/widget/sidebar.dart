import 'package:flutter/material.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/localization/locale_controller.dart';
import '../../../../global_imports.dart';
import '../../../profile/presentation/pages/profile_settings_screen.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Drawer(
      backgroundColor: AppColor.white,
      child: SafeArea(
        child: Column(
          children: [
            // Logo Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: Column(
                children: [
                  // Logo Image
                  Image.asset(
                  AppAssets.imagesPlayStore512Alt,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                ],
              ),
            ),
            
            const Divider(height: 1),
            
            // Menu Items Section
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                children: [
                  _MenuItem(
                    icon: Icons.person,
                    title: t.profile,
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()));
                    },
                  ),
                  _MenuItem(
                    icon: Icons.language,
                    title: t.changeLanguage,
                    onTap: () {
                      LocaleController.of(context).toggle();
                    },
                  ),
                  _MenuItem(
                    icon: Icons.privacy_tip,
                    title: t.privacyPolicy,
                    onTap: () {
                      // TODO: Navigate to Privacy Policy
                    },
                  ),
                  _MenuItem(
                    icon: Icons.contact_support,
                    title: t.contactUs,
                    onTap: () {
                      // TODO: Navigate to Contact Us
                    },
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1),
                  const SizedBox(height: 8),
                  _MenuItem(
                    icon: Icons.logout,
                    title: t.logout,
                    onTap: () {
                      // TODO: Handle Logout
                    },
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? AppColor.red : AppColor.primaryColor,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isLogout ? FontWeight.w600 : FontWeight.normal,
          color: isLogout ? AppColor.red : AppColor.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        onTap();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

