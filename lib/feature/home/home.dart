import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../core/utils/color.dart';
import 'presentation/pages/appointments_page.dart';
import 'presentation/pages/favorites_page.dart';
import 'presentation/pages/home_content_page.dart';
import 'presentation/widget/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Current selected index - Home is centered (index 1)
  int _currentIndex = 1;

  /// GlobalKey for curved navigation bar (for programmatic control if needed)
  final GlobalKey<CurvedNavigationBarState> _bottomNavKey = GlobalKey();

  /// List of pages to display - order matches navigation bar icons
  /// Index 0: Favorites (left)
  /// Index 1: Home (center)
  /// Index 2: Appointments (right)
  final List<Widget> _pages = const [
    FavoritesPage(),
    HomeContentPage(),
    AppointmentsPage(),
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomSidebar(),
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavKey,
        index: _currentIndex,
        height: 65,
        items: [
          _buildNavItem(
            icon: Icons.favorite,
            isSelected: _currentIndex == 0,
          ),
          _buildNavItem(
            icon: Icons.home,
            isSelected: _currentIndex == 1,
          ),
          _buildNavItem(
            icon: Icons.calendar_month,
            isSelected: _currentIndex == 2,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: AppColor.blueColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: _onNavTap,
      ),
    );
  }

  /// Builds individual navigation bar item with proper icon styling
  Widget _buildNavItem({
    required IconData icon,
    required bool isSelected,
  }) {
    return Icon(
      icon,
      size: 28,
      color: isSelected ? AppColor.white : AppColor.blueColor,
    );
  }
}
