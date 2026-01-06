import 'package:flutter/material.dart';

import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Favorites',
                      style: AppTextStyle.style24B.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your saved doctors and services',
                      style: AppTextStyle.style14.copyWith(
                        color: AppColor.white,
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
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/no-data-avaolble.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No favorites yet',
                      style: AppTextStyle.style18B.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start adding your favorite doctors',
                      style: AppTextStyle.style14.copyWith(
                        color: AppColor.grey.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

