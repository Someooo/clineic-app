import 'package:flutter/material.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';

class SpecialityCard extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final String? color;
  final VoidCallback? onTap;

  const SpecialityCard({
    super.key,
    required this.name,
    this.imageUrl,
    this.color,
    this.onTap,
  });

  Color _parseColor(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return AppColor.primaryColor;
    }
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return AppColor.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = _parseColor(color);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
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
            // Speciality Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: imageUrl != null && imageUrl!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.medical_services,
                            color: cardColor,
                            size: 30,
                          );
                        },
                      ),
                    )
                  : Icon(
                      Icons.medical_services,
                      color: cardColor,
                      size: 30,
                    ),
            ),
            const SizedBox(width: 16),
            // Name
            Expanded(
              child: Text(
                name,
                style: AppTextStyle.style16B.copyWith(
                  color: AppColor.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            // Arrow Icon
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColor.white,
            ),
          ],
        ),
      ),
    );
  }
}


