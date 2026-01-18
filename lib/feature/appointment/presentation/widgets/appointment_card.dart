import 'package:flutter/material.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../domain/entities/appointment_entity.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentEntity appointment;

  const AppointmentCard({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColor.tealColor.withOpacity(0.2),
                        AppColor.blueColor.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: ClipOval(
                    child: appointment.userImage.isNotEmpty
                        ? Image.network(
                            appointment.userImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.person,
                                color: AppColor.primaryColor,
                                size: 24,
                              );
                            },
                          )
                        : Icon(
                            Icons.person,
                            color: AppColor.primaryColor,
                            size: 24,
                          ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.userName,
                        style: AppTextStyle.style16B.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        appointment.hospital,
                        style: AppTextStyle.style14.copyWith(
                          color: AppColor.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(appointment.status).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _getStatusColor(appointment.status).withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    appointment.status.displayName,
                    style: AppTextStyle.style12.copyWith(
                      color: _getStatusColor(appointment.status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.calendar_today,
                      color: AppColor.primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${appointment.day} ${appointment.month}',
                          style: AppTextStyle.style14B.copyWith(
                            color: AppColor.black,
                          ),
                        ),
                        Text(
                          appointment.appointmentDate,
                          style: AppTextStyle.style12.copyWith(
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.access_time,
                      color: AppColor.secondaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.appointmentTime,
                        style: AppTextStyle.style14B.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                      Text(
                        'Appointment Time',
                        style: AppTextStyle.style12.copyWith(
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (appointment.patientName.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.blueColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: AppColor.blueColor,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Patient: ${appointment.patientName}',
                      style: AppTextStyle.style12.copyWith(
                        color: AppColor.blueColor,
                      ),
                    ),
                    if (appointment.relation.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.blueColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          appointment.relation,
                          style: AppTextStyle.style12.copyWith(
                            color: AppColor.blueColor,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.pending:
        return Colors.orange;
      case AppointmentStatus.inProgress:
        return AppColor.primaryColor;
      case AppointmentStatus.completed:
        return AppColor.secondaryColor;
      case AppointmentStatus.cancelled:
        return AppColor.red;
    }
  }
}
