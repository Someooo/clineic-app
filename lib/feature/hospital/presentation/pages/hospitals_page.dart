import '../../../../global_imports.dart';
import '../cubit/hospital_cubit.dart';
import '../widget/hospital_card.dart';
import 'hospital_details_page.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

class HospitalsPage extends StatelessWidget {
  const HospitalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HospitalCubit>()..getHospitalsList(),
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
                              AppLocalizations.of(context)!.listOfHospitals,
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
                  child: BlocBuilder<HospitalCubit, HospitalState>(
                    builder: (context, state) {
                      if (state.status == 'loading') {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state.status == 'error') {
                        return Container(
                          child: Text(
                            state.message ?? AppLocalizations.of(context)!.error,
                            style: AppTextStyle.style14.copyWith(
                              color: AppColor.red,
                            ),
                          ),
                        );
                      }

                      final hospitals = state.hospitals;

                      if (hospitals.isEmpty) {
                        return const NoDataWidget(
                          title: 'No hospitals available',
                          subtitle: 'Check back later for hospital listings',
                        );
                      }

                      return ListView.builder(
                        itemCount: hospitals.length,
                        itemBuilder: (context, index) {
                          final hospital = hospitals[index];
                          final avatarColors = [
                            const Color(0xFF2196F3),
                            const Color(0xFFE91E63),
                            const Color(0xFFF44336),
                            const Color(0xFF4CAF50),
                            const Color(0xFF9C27B0),
                            const Color(0xFFFF9800),
                          ];

                          return HospitalCard(
                            hospital: hospital,
                            avatarColor:
                                avatarColors[index % avatarColors.length],
                            isBookmarked: false,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => HospitalDetailsPage(
                                        hospital: hospital,
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
      ),
    );
  }
}
