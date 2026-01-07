import 'package:flutter/material.dart';

import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/status_widget/no_data_widget.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

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
                      'Appointments',
                      style: AppTextStyle.style24B.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Manage your upcoming visits',
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
                color: Color(0xFFF2F7FA),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: const NoDataWidget(
                title: 'No appointments',
                subtitle: 'Book your first appointment',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

