import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/text_style.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? imageWidth;
  final double? imageHeight;

  const NoDataWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.imageWidth = 250,
    this.imageHeight = 250,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no-data-avaolble.png',
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyle.style18B.copyWith(
              color: AppColor.grey,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: AppTextStyle.style14.copyWith(
                color: AppColor.grey.withOpacity(0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }
}




