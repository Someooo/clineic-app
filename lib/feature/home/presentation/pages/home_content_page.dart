import 'package:flutter/material.dart';

import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../auth/data/datasource/auth_local_data_source.dart';
import '../../../../global_imports.dart';
import '../widget/category_card.dart';

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({super.key});

  @override
  State<HomeContentPage> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  late final TextEditingController searchController;
  late final Future<AuthUserModel?> _userFuture;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _userFuture = getIt<AuthLocalDataSource>().getUser();
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
        'title': 'hospital',
        'icon': Icons.local_hospital,
        'color': const Color(0xFF2196F3),
        'type': 'hospital',
      },
      
    ];

    return Container(
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
                              FutureBuilder<AuthUserModel?>(
                                future: _userFuture,
                                builder: (context, snapshot) {
                                  final fullName = snapshot.data?.fullName;
                                  final text = (fullName != null &&
                                          fullName.trim().isNotEmpty)
                                      ? fullName
                                      : 'welcomeUserDenis'.tr();
                                  return Text(
                                    text,
                                    style: AppTextStyle.style24B.copyWith(
                                      color: AppColor.white,
                                    ),
                                  );
                                },
                              ),
                              // 8.gap,
                              // Text(
                              //   'welcomeSubtitle'.tr(),
                              //   style: AppTextStyle.style14.copyWith(
                              //     color: AppColor.white,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Builder(
                          builder:
                              (context) => IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(
                                  Icons.grid_view,
                                  color: AppColor.white,
                                  size: 28,
                                ),
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
                color: Color(0xFFF2F7FA),
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
                    10.gap,
                    // Categories Section
                    Row(
                      children: [
                           Icon(
                          Icons.medical_services,
                          color:  Colors.blue,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'categories'.tr(),
                          style: AppTextStyle.style18B.copyWith(
                            color: AppColor.black,
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
                              context.push(AppRoutes.hospitals);
                            },
                          );
                        },
                      ),
                    ),
                    32.gap,
                    // Services Section
                    Row(
                      children: [
                        Icon(
                          Icons.medical_services,
                          color:  Colors.blue,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'allServices'.tr(),
                          style: AppTextStyle.style18B.copyWith(
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                    16.gap,
                    // Speciality Card
                    GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.specialities);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF90CAF9).withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: AppColor.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.medical_services,
                                color: AppColor.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'specialities'.tr(),
                                    style: AppTextStyle.style18B.copyWith(
                                      color: AppColor.white,
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                    // Add bottom padding for navigation bar
                    80.gap,
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
