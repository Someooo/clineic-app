import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../global_imports.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import '../../domain/entities/doctor_hospital_entity.dart';
import '../../domain/entities/doctor_profile_entity.dart';
import '../cubit/doctor_detail_cubit.dart';

class DoctorDetailPage extends StatelessWidget {
  final int doctorId;
  final String doctorName;

  const DoctorDetailPage({
    super.key,
    required this.doctorId,
    required this.doctorName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => getIt<DoctorDetailCubit>()..getDoctorDetail(doctorId),
      child: Scaffold(
        appBar: AppBar(
          title: Text(doctorName, style: AppTextStyle.headLine1),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColor.white,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColor.tealColor, AppColor.blueColor],
              ),
            ),
          ),
        ),
        backgroundColor: AppColor.white,
        body: BlocBuilder<DoctorDetailCubit, DoctorDetailState>(
          builder: (context, state) {
            if (state.status == 'loading') {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == 'error') {
              return Center(
                child: Text(
                  state.message ?? AppLocalizations.of(context)!.error,
                  style: AppTextStyle.style14.copyWith(color: AppColor.red),
                ),
              );
            }

            final detail = state.doctorDetail;
            if (detail == null) {
              return Center(
                child: Text(
                  'Invalid response data',
                  style: AppTextStyle.style14.copyWith(color: AppColor.grey),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileHeader(detail.profile),
                  const SizedBox(height: 20),
                  Text(
                    'Hospitals',
                    style: AppTextStyle.style18B.copyWith(
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (detail.hospitals.isEmpty)
                    Text(
                      'No hospitals available',
                      style: AppTextStyle.style14.copyWith(
                        color: AppColor.grey,
                      ),
                    )
                  else
                    Column(
                      children:
                          detail.hospitals
                              .map(
                                (hospital) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: _buildHospitalCard(hospital),
                                ),
                              )
                              .toList(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader(DoctorProfileEntity profile) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: AppColor.grey.withOpacity(0.2),
                backgroundImage:
                    profile.avatar != null
                        ? NetworkImage(profile.avatar!)
                        : null,
                child:
                    profile.avatar == null
                        ? Icon(
                          Icons.person,
                          color: AppColor.tealColor,
                          size: 32,
                        )
                        : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.fullName,
                      style: AppTextStyle.style18B.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      profile.subHeading ?? 'General Practitioner',
                      style: AppTextStyle.style14.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildInfoBadge(
                label: 'Rating',
                value: profile.averageRating ?? '0',
              ),
              const SizedBox(width: 8),
              _buildInfoBadge(label: 'Votes', value: '${profile.votes ?? 0}'),
            ],
          ),
          const SizedBox(height: 10),
          if (profile.location != null)
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: AppColor.grey),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    profile.location!,
                    style: AppTextStyle.style14.copyWith(color: AppColor.grey),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 8),
          _buildChipList(items: profile.specialities, label: 'Specialities'),
          const SizedBox(height: 8),
          _buildChipList(items: profile.services, label: 'Services'),
          const SizedBox(height: 8),
          if (profile.availableDays.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children:
                  profile.availableDays
                      .map(
                        (day) => Chip(
                          label: Text(
                            day,
                            style: AppTextStyle.style12.copyWith(
                              color: AppColor.black,
                            ),
                          ),
                          backgroundColor: AppColor.grey.withOpacity(0.1),
                        ),
                      )
                      .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildHospitalCard(DoctorHospitalEntity hospital) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.grey.withOpacity(0.2)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage:
                    hospital.avatar != null
                        ? NetworkImage(hospital.avatar!)
                        : null,
                child:
                    hospital.avatar == null
                        ? Icon(
                          Icons.medical_services,
                          color: AppColor.tealColor,
                          size: 20,
                        )
                        : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospital.fullName,
                      style: AppTextStyle.style16B.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    if (hospital.location != null)
                      Text(
                        hospital.location!,
                        style: AppTextStyle.style14.copyWith(
                          color: AppColor.grey,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Working hours:',
                style: AppTextStyle.style12.copyWith(color: AppColor.grey),
              ),
              const SizedBox(width: 6),
              Text(
                hospital.workingTime ?? 'n/a',
                style: AppTextStyle.style12.copyWith(color: AppColor.black),
              ),
              const Spacer(),
              if (hospital.approvedTeams != null)
                Text(
                  '${hospital.approvedTeams} teams',
                  style: AppTextStyle.style12.copyWith(
                    color: Colors.blue,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          if (hospital.availableDays.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children:
                  hospital.availableDays
                      .map(
                        (day) => Chip(
                          label: Text(
                            day,
                            style: AppTextStyle.style12.copyWith(
                              color: AppColor.black,
                            ),
                          ),
                          backgroundColor: AppColor.grey.withOpacity(0.1),
                        ),
                      )
                      .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoBadge({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: AppTextStyle.style12.copyWith(color: AppColor.grey),
          ),
          Text(
            value,
            style: AppTextStyle.style12.copyWith(color: AppColor.black),
          ),
        ],
      ),
    );
  }

  Widget _buildChipList({required List<String> items, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.style12.copyWith(color: AppColor.grey)),
        const SizedBox(height: 6),
        if (items.isEmpty)
          Text(
            'Not available',
            style: AppTextStyle.style12.copyWith(color: AppColor.grey),
          )
        else
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children:
                items
                    .map(
                      (item) => Chip(
                        label: Text(
                          item,
                          style: AppTextStyle.style12.copyWith(
                            color: AppColor.black,
                          ),
                        ),
                        backgroundColor: AppColor.grey.withOpacity(0.1),
                      ),
                    )
                    .toList(),
          ),
      ],
    );
  }
}
