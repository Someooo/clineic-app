import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/color.dart';
import '../../global_imports.dart';
import '../doctor_detail/presentation/pages/dr_list.dart';
import '../doctor_detail/presentation/cubit/doctor_list_cubit.dart';
import 'presentation/cubit/home_cubit.dart';
import 'presentation/pages/appointments_page.dart';
import 'presentation/pages/home_content_page.dart';
import '../forums/forums.dart';
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
  /// Index 3: Forum (far right)
  List<Widget> get _pages => [
    BlocProvider(
      create: (context) => getIt<DoctorListCubit>()..init(),
      child: const DoctorListPage(),
    ),
    BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: const HomeContentPage(),
    ),
    const AppointmentsPage(),
    const ForumsPageWrapper(),
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
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavKey,
        index: _currentIndex,
        height: 65,
        items: [
         
          _buildNavItem(icon: Icons.person, isSelected: _currentIndex == 0),
          _buildNavItem(icon: Icons.home, isSelected: _currentIndex == 1),
          _buildNavItem(
            icon: Icons.calendar_month,
            isSelected: _currentIndex == 2,
          ),
          _buildNavItem(icon: Icons.forum, isSelected: _currentIndex == 3),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: _onNavTap,
      ),
    );
  }

  /// Builds individual navigation bar item with proper icon styling
  Widget _buildNavItem({required IconData icon, required bool isSelected}) {
    return Icon(
      icon,
      size: 28,
      color: isSelected ? AppColor.white : Colors.blue,
    );
  }
}
