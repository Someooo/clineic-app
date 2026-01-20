import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../domain/entities/forum_entity.dart';

class ForumCard extends StatelessWidget {
  final ForumEntity forum;

  const ForumCard({
    super.key,
    required this.forum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with image and title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Forum image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    forum.image,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          Icons.image,
                          size: 24.w,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
                12.gap,
                // Title and metadata
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        forum.title,
                        style: AppTextStyle.style16B.copyWith(
                          color: AppColor.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      8.gap,
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14.w,
                            color: Colors.grey[600],
                          ),
                          4.gap,
                          Text(
                            forum.postDate,
                            style: AppTextStyle.style12.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          12.gap,
                          Icon(
                            Icons.comment,
                            size: 14.w,
                            color: Colors.grey[600],
                          ),
                          4.gap,
                          Text(
                            '${forum.answers} answers',
                            style: AppTextStyle.style12.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            12.gap,
            // Content
            Text(
              forum.content,
              style: AppTextStyle.style14.copyWith(
                color: Colors.grey[700],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            12.gap,
            // Footer
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFB),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID: ${forum.id}',
                    style: AppTextStyle.style12.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '${forum.count} views',
                    style: AppTextStyle.style12.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
