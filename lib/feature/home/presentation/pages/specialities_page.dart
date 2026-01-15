import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/status_widget/no_data_widget.dart';
import '../../../../global_imports.dart';
import '../cubit/home_cubit.dart';
import '../widget/speciality_card.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

class SpecialitiesPage extends StatelessWidget {
  const SpecialitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getSpecialitiesList(),
      child: Container(
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
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColor.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.specialities,
                              style: AppTextStyle.style24B.copyWith(
                                color: AppColor.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          
                          ],
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
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state.status == 'error') {
                        return Center(
                          child: Text(
                            state.message ?? AppLocalizations.of(context)!.error,
                            style: AppTextStyle.style14.copyWith(
                              color: AppColor.red,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        );
                      }

                      final specialities = state.specialities;

                      if (specialities.isEmpty) {
                        return const NoDataWidget(
                          title: 'No specialities available',
                          subtitle: 'Check back later for speciality listings',
                        );
                      }

                      return ListView.builder(
                        itemCount: specialities.length,
                        itemBuilder: (context, index) {
                          final speciality = specialities[index];
                          return SpecialityCard(
                            name: speciality.name,
                            imageUrl: speciality.url,
                            color: speciality.color,
                            onTap: () {
                              // Handle speciality tap
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
      ),
    );
  }
}


