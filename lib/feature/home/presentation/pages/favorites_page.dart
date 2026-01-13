import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/status_widget/no_data_widget.dart';
import '../../../../global_imports.dart';
import '../cubit/home_cubit.dart';
import 'doctor_detail_page.dart';
import '../widget/doctor_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          // Header Section
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
                    Text(
                      'Doctor List',
                      style: AppTextStyle.style24B.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Browse all available doctors',
                      style: AppTextStyle.style14.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // White Content Area
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F7FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state.status == 'loading') {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.status == 'error') {
                      return Center(
                        child: Text(
                          state.message ?? 'error'.tr(),
                          style: AppTextStyle.style14.copyWith(
                            color: AppColor.red,
                          ),
                        ),
                      );
                    }

                    final doctors = state.doctors;

                    if (doctors.isEmpty) {
                      return const NoDataWidget(
                        title: 'No favorites yet',
                        subtitle: 'Start adding your favorite doctors',
                      );
                    }

                    return ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = doctors[index];

                        return DoctorCard(
                          doctor: doctor,
                          isBookmarked: true,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => DoctorDetailPage(
                                      doctorId: doctor.id,
                                      doctorName: doctor.fullName,
                                    ),
                              ),
                            );
                          },
                          onBookmarkTap: () {
                            // Handle bookmark tap
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
