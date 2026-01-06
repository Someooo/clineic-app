import 'package:flutter/material.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 120,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withOpacity(0.7),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background icon
            Positioned(
              right: -10,
              bottom: -10,
              child: Icon(
                icon,
                size: 80,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: AppTextStyle.style18B.copyWith(
                    color: AppColor.white,
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

