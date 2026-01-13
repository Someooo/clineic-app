import 'package:flutter/widgets.dart' as flutter_widgets show ConnectionState;

import '../../../../global_imports.dart';

class DoctorDetailPage extends StatefulWidget {
  final int doctorId;
  final String doctorName;

  const DoctorDetailPage({
    super.key,
    required this.doctorId,
    required this.doctorName,
  });

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  late final Future<DoctorDetail> _detailFuture;

  @override
  void initState() {
    super.initState();
    _detailFuture = _fetchDoctorDetail();
  }

  Future<DoctorDetail> _fetchDoctorDetail() async {
    final apiServices = getIt<ApiServices>();
    final response = await apiServices.getData(
      '/api/doctor/profile/${widget.doctorId}',
    );
    final data = response['data'] as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('Doctor profile is not available');
    }

    return DoctorDetail.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctorName),
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
      body: FutureBuilder<DoctorDetail>(
        future: _detailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              flutter_widgets.ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error?.toString() ?? 'error'.tr(),
                style: AppTextStyle.style14.copyWith(color: AppColor.red),
              ),
            );
          }

          final detail = snapshot.data;
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
                  style: AppTextStyle.style18B.copyWith(color: AppColor.black),
                ),
                const SizedBox(height: 12),
                if (detail.hospitals.isEmpty)
                  Text(
                    'No hospitals available',
                    style: AppTextStyle.style14.copyWith(color: AppColor.grey),
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
    );
  }

  Widget _buildProfileHeader(DoctorProfile profile) {
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

  Widget _buildHospitalCard(DoctorHospital hospital) {
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
                    color: AppColor.tealColor,
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

@immutable
class DoctorDetail {
  final DoctorProfile profile;
  final List<DoctorHospital> hospitals;

  const DoctorDetail({required this.profile, required this.hospitals});

  factory DoctorDetail.fromJson(Map<String, dynamic> json) {
    final profileJson = json['profile'] as Map<String, dynamic>?;
    final hospitalsJson = json['doctor_hospitals'] as List<dynamic>?;

    if (profileJson == null) {
      throw Exception('No profile data returned');
    }

    return DoctorDetail(
      profile: DoctorProfile.fromJson(profileJson),
      hospitals:
          (hospitalsJson ?? <dynamic>[])
              .map((item) {
                if (item is Map<String, dynamic>) {
                  return DoctorHospital.fromJson(item);
                }
                return DoctorHospital.empty;
              })
              .where((hospital) => hospital.id != 0)
              .toList(),
    );
  }
}

@immutable
class DoctorProfile {
  final int id;
  final String fullName;
  final String? subHeading;
  final String? avatar;
  final String? averageRating;
  final int? totalRating;
  final String? location;
  final List<String> specialities;
  final List<String> services;
  final List<String> availableDays;
  final String? workingTime;
  final int? votes;

  const DoctorProfile({
    required this.id,
    required this.fullName,
    this.subHeading,
    this.avatar,
    this.averageRating,
    this.totalRating,
    this.location,
    this.specialities = const [],
    this.services = const [],
    this.availableDays = const [],
    this.workingTime,
    this.votes,
  });

  factory DoctorProfile.fromJson(Map<String, dynamic> json) {
    return DoctorProfile(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      subHeading: json['sub_heading'] as String?,
      avatar: json['avatar'] as String?,
      averageRating: json['average_rating'] as String?,
      totalRating: (json['total_rating'] as num?)?.toInt(),
      location: json['location'] as String?,
      specialities: _toStringList(json['specialities']),
      services: _toStringList(json['services']),
      availableDays: _parseAvailableDays(json['available_days']),
      workingTime: json['working_time'] as String?,
      votes: (json['votes'] as num?)?.toInt(),
    );
  }
}

@immutable
class DoctorHospital {
  final int id;
  final String fullName;
  final String? subHeading;
  final String? avatar;
  final String? location;
  final List<String> availableDays;
  final String? workingTime;
  final int? approvedTeams;

  const DoctorHospital({
    required this.id,
    required this.fullName,
    this.subHeading,
    this.avatar,
    this.location,
    this.availableDays = const [],
    this.workingTime,
    this.approvedTeams,
  });

  factory DoctorHospital.fromJson(Map<String, dynamic> json) {
    return DoctorHospital(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      subHeading: json['sub_heading'] as String?,
      avatar: json['avatar'] as String?,
      location: json['location'] as String?,
      availableDays: _parseAvailableDays(json['available_days']),
      workingTime: json['working_time'] as String?,
      approvedTeams: (json['approvedTeams'] as num?)?.toInt(),
    );
  }

  static const DoctorHospital empty = DoctorHospital(id: 0, fullName: '');
}

List<String> _toStringList(dynamic value) {
  if (value is List) {
    return value
        .whereType<String>()
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  if (value is String) {
    return value
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  }

  return [];
}

List<String> _parseAvailableDays(dynamic value) {
  if (value is List) {
    return value.whereType<String>().toList();
  }

  if (value is String) {
    return value
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  }

  return [];
}
