import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../global_imports.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import '../../domain/entities/doctor_list_entity.dart';

class DoctorCard extends StatelessWidget {
  final DoctorListEntity doctor;
  final bool isBookmarked;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  const DoctorCard({
    super.key,
    required this.doctor,
    this.isBookmarked = false,
    this.onTap,
    this.onBookmarkTap,
  });

  List<String> _parseAvailableDays(dynamic value) {
    if (value is List) {
      return value.whereType<String>().toList();
    }
    if (value is String && value.isNotEmpty) {
      return value
          .split(',')
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList();
    }
    return [];
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

  @override
  Widget build(BuildContext context) {
    final specialities = _toStringList(doctor.specialities);
    final availableDays = _parseAvailableDays(doctor.availableDays);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
                      doctor.avatar != null
                          ? NetworkImage(doctor.avatar!)
                          : null,
                  child:
                      doctor.avatar == null
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
                        doctor.fullName,
                        style: AppTextStyle.style18B.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doctor.subHeading ??
                            AppLocalizations.of(context)!.generalPractitioner,
                        style: AppTextStyle.style14.copyWith(
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onBookmarkTap,
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? AppColor.primaryColor : AppColor.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoBadge(
                  label: AppLocalizations.of(context)!.rating,
                  value: doctor.averageRating ?? '0',
                ),
                const SizedBox(width: 8),
                _buildInfoBadge(
                  label: AppLocalizations.of(context)!.votes,
                  value: '${doctor.votes ?? 0}',
                ),
              ],
            ),
            if (doctor.location != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: AppColor.grey),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      doctor.location.toString(),
                      style: AppTextStyle.style14.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            if (specialities.isNotEmpty) ...[
              const SizedBox(height: 8),
              _buildChipList(
                items: specialities,
                label: AppLocalizations.of(context)!.specialities,
              ),
            ],
            if (availableDays.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children:
                    availableDays
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
          ],
        ),
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
