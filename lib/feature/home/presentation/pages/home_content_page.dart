import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/app_widget/custom_text_field.dart';
import '../../../../global_imports.dart';
import '../cubit/home_cubit.dart';
import '../widget/category_card.dart';
import '../widget/doctor_card.dart';
import '../widget/service_card.dart';

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({super.key});

  @override
  State<HomeContentPage> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
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

    // Color palette for doctor avatars
    final avatarColors = [
      const Color(0xFF2196F3),
      const Color(0xFFE91E63),
      const Color(0xFFF44336),
      const Color(0xFF4CAF50),
      const Color(0xFF9C27B0),
      const Color(0xFFFF9800),
    ];

    // Services data
    final services = [
      {
        'title': 'primaryCare',
        'description': 'primaryCareDesc',
        'icon': Icons.medical_services,
      },
      {
        'title': 'familyMedicine',
        'description': 'familyMedicineDesc',
        'icon': Icons.family_restroom,
      },
      {
        'title': 'internalMedicine',
        'description': 'internalMedicineDesc',
        'icon': Icons.local_hospital,
      },
      {
        'title': 'urgentCare',
        'description': 'urgentCareDesc',
        'icon': Icons.emergency,
      },
      {
        'title': 'pediatrics',
        'description': 'pediatricsDesc',
        'icon': Icons.child_care,
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
                        Builder(
                          builder: (context) => IconButton(
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
                    // 16.gap,
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state.status == 'loading') {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        
                        if (state.status == 'error') {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                state.message ?? 'error'.tr(),
                                style: AppTextStyle.style14.copyWith(
                                  color: AppColor.red,
                                ),
                              ),
                            ),
                          );
                        }
                        
                        final doctors = state.doctors;
                        
                        if (doctors.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'noDoctorsAvailable'.tr(),
                                style: AppTextStyle.style14.copyWith(
                                  color: AppColor.grey,
                                ),
                              ),
                            ),
                          );
                        }
                        
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: doctors.length,
                          itemBuilder: (context, index) {
                            final doctor = doctors[index];
                            final specialty = doctor.specialities != null && 
                                doctor.specialities!.isNotEmpty
                                ? doctor.specialities!.first.toString()
                                : 'generalPractitioner'.tr();
                            
                            return DoctorCard(
                              name: doctor.fullName,
                              specialty: specialty,
                              icon: Icons.person,
                              avatarColor: avatarColors[index % avatarColors.length],
                              isBookmarked: false,
                              onTap: () {
                                // Handle doctor tap
                              },
                              onBookmarkTap: () {
                                // Handle bookmark tap
                              },
                            );
                          },
                        );
                      },
                    ),
                    32.gap,
                    // Services Section
                    Row(
                      children: [
                        Icon(
                          Icons.medical_services,
                          color: const Color(0xFF00B8B3),
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
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return ServiceCard(
                          title: (service['title'] as String).tr(),
                          description: (service['description'] as String).tr(),
                          icon: service['icon'] as IconData,
                          onTap: () {
                            // Handle service tap
                          },
                        );
                      },
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

