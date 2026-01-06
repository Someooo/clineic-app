import 'package:flutter/material.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final IconData icon;
  final Color avatarColor;
  final bool isBookmarked;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.icon,
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
              child: Icon(
                icon,
                color: avatarColor,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            // Name and Specialty
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.style16B.copyWith(
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: AppTextStyle.style14.copyWith(
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Bookmark Icon
            IconButton(
              onPressed: onBookmarkTap,
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: isBookmarked ? AppColor.primaryColor : AppColor.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

