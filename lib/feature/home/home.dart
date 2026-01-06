import 'package:flutter/material.dart';

import '../../core/extension/space_extension.dart';
import '../../core/utils/color.dart';
import '../../core/utils/text_style.dart';
import '../../core/widget/app_widget/custom_text_field.dart';
import '../../global_imports.dart';
import 'presentation/widget/category_card.dart';
import 'presentation/widget/doctor_card.dart';
import 'presentation/widget/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fake data for categories
    final categories = [
      {
        'title': 'dental',
        'icon': Icons.local_hospital,
        'color': const Color(0xFF4CAF50),
      },
      {'title': 'derma', 'icon': Icons.face, 'color': const Color(0xFFE91E63)},
      {
        'title': 'cardiology',
        'icon': Icons.favorite,
        'color': const Color(0xFFF44336),
      },
      {
        'title': 'neurology',
        'icon': Icons.psychology,
        'color': const Color(0xFF9C27B0),
      },
    ];

    // Fake data for doctors
    final doctors = [
      {
        'name': 'Annie Lee',
        'specialty': 'orthodontist',
        'icon': Icons.person,
        'color': const Color(0xFF2196F3),
        'isBookmarked': false,
      },
      {
        'name': 'Dr. Sarah Johnson',
        'specialty': 'dermatologist',
        'icon': Icons.person,
        'color': const Color(0xFFE91E63),
        'isBookmarked': true,
      },
      {
        'name': 'Dr. Michael Chen',
        'specialty': 'cardiologist',
        'icon': Icons.person,
        'color': const Color(0xFFF44336),
        'isBookmarked': false,
      },
    ];

    return Scaffold(
      drawer: const CustomSidebar(),
      body: Builder(
        builder: (context) => Container(
          decoration: BoxDecoration(
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
              decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.bottomLeft,
              //     end: Alignment.topRight,
              //     colors: [AppColor.tealColor, AppColor.blueColor],
              //   ),
              ),
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
                                  'welcomeUserDenis'.tr(),
                                  style: AppTextStyle.style24B.copyWith(
                                    color: AppColor.white,
                                  ),
                                ),
                                8.gap,
                                Text(
                                  'welcomeSubtitle'.tr(),
                                  style: AppTextStyle.style14.copyWith(
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.grid_view,
                              color: AppColor.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      20.gap,
                    ],
                  ),
                ),
              ),
            ),
            // White Content Area
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      CustomTextField(
                        controller: searchController,
                        hintText: 'searchForCategories'.tr(),
                        prefixIconAssetName: Icons.search,
                        fillColor: Colors.grey[100],
                        filled: true,
                        customBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: AppTextStyle.style14.copyWith(
                          color: Colors.grey[600],
                        ),
                        contentVerticalPadding: 16,
                      ),
                      24.gap,
                      // Categories Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'categories'.tr(),
                            style: AppTextStyle.style18B.copyWith(
                              color: const Color(0xFF00B8B3),
                            ),
                          ),
                        ],
                      ),
                      16.gap,
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return CategoryCard(
                              title: (category['title'] as String).tr(),
                              icon: category['icon'] as IconData,
                              color: category['color'] as Color,
                              onTap: () {
                                // Handle category tap
                              },
                            );
                          },
                        ),
                      ),
                      32.gap,
                      // Doctors Section
                      Text(
                        'doctors'.tr(),
                        style: AppTextStyle.style18B.copyWith(
                          color: const Color(0xFF00B8B3),
                        ),
                      ),
                      16.gap,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          final doctor = doctors[index];
                          return DoctorCard(
                            name: doctor['name'] as String,
                            specialty: (doctor['specialty'] as String).tr(),
                            icon: doctor['icon'] as IconData,
                            avatarColor: doctor['color'] as Color,
                            isBookmarked: doctor['isBookmarked'] as bool,
                            onTap: () {
                              // Handle doctor tap
                            },
                            onBookmarkTap: () {
                              // Handle bookmark tap
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
        ),
    );
  }
}
