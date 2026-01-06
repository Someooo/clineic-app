import 'package:flutter/material.dart';
import '../../../../core/utils/color.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'assets/images/ECLINIC – 1.png',
                    width: 120,
                    height: 60,
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
                    title: 'Profile',
                    onTap: () {
                      // TODO: Navigate to Profile
                    },
                  ),
                  _MenuItem(
                    icon: Icons.language,
                    title: 'Change Language',
                    onTap: () {
                      // TODO: Open Language Selection
                    },
                  ),
                  _MenuItem(
                    icon: Icons.privacy_tip,
                    title: 'Privacy Policy',
                    onTap: () {
                      // TODO: Navigate to Privacy Policy
                    },
                  ),
                  _MenuItem(
                    icon: Icons.contact_support,
                    title: 'Contact Us',
                    onTap: () {
                      // TODO: Navigate to Contact Us
                    },
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1),
                  const SizedBox(height: 8),
                  _MenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
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

