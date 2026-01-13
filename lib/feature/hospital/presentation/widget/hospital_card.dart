import '../../../../global_imports.dart';
import '../../domain/entities/hospital_entity.dart';

class HospitalCard extends StatelessWidget {
  final HospitalEntity hospital;
  final Color avatarColor;
  final bool isBookmarked;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  const HospitalCard({
    super.key,
    required this.hospital,
    required this.avatarColor,
    this.isBookmarked = false,
    this.onTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 30,
              backgroundColor: avatarColor.withOpacity(0.2),
              backgroundImage:
                  hospital.avatar != null && hospital.avatar!.isNotEmpty
                      ? NetworkImage(hospital.avatar!)
                      : null,
              child:
                  hospital.avatar == null || hospital.avatar!.isEmpty
                      ? Icon(Icons.local_hospital, color: avatarColor, size: 30)
                      : null,
            ),
            const SizedBox(width: 16),
            // Name and Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospital.fullName,
                    style: AppTextStyle.style16B.copyWith(
                      color: AppColor.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  if (hospital.location != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: AppColor.grey),
                        const SizedBox(width: 4),
                        Text(
                          hospital.location!,
                          style: AppTextStyle.style14.copyWith(
                            color: AppColor.grey,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (hospital.workingTime != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 14, color: AppColor.grey),
                        const SizedBox(width: 4),
                        Text(
                          hospital.workingTime!.replaceAll('_', ' '),
                          style: AppTextStyle.style12.copyWith(
                            color: AppColor.grey,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            // Bookmark Icon
            IconButton(
              onPressed: onBookmarkTap,
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: isBookmarked ? AppColor.primaryColor : AppColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
