import '../../../../global_imports.dart';
import '../../../../core/widget/app_widget/custom_gradient_app_bar.dart';
import '../../domain/entities/hospital_entity.dart';
import 'hospital_team_page.dart';

class HospitalDetailsPage extends StatelessWidget {
  final HospitalEntity hospital;

  const HospitalDetailsPage({super.key, required this.hospital});

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
          CustomGradientAppBar(
            title: hospital.fullName,
            showBackButton: true,
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hospital Image/Avatar
                    if (hospital.avatar != null && hospital.avatar!.isNotEmpty)
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.primaryColor,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.network(
                              hospital.avatar!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.local_hospital,
                                  size: 60,
                                  color: AppColor.primaryColor,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    if (hospital.avatar != null && hospital.avatar!.isNotEmpty)
                      const SizedBox(height: 24),
                    // Location
                    if (hospital.location != null) ...[
                      _buildInfoSection(
                        icon: Icons.location_on,
                        title: 'Location',
                        content: hospital.location!,
                      ),
                      const SizedBox(height: 16),
                    ],
                    // Working Time
                    if (hospital.workingTime != null) ...[
                      _buildInfoSection(
                        icon: Icons.access_time,
                        title: 'Working Time',
                        content: hospital.workingTime!.replaceAll('_', ' '),
                      ),
                      const SizedBox(height: 16),
                    ],
                    // Available Days
                    if (hospital.availableDays != null &&
                        hospital.availableDays!.isNotEmpty) ...[
                      _buildInfoSection(
                        icon: Icons.calendar_today,
                        title: 'Available Days',
                        content: hospital.availableDays!.join(', '),
                      ),
                      const SizedBox(height: 16),
                    ],
                    // Approved Teams
                    if (hospital.approvedTeams != null) ...[
                      _buildInfoSection(
                        icon: Icons.people,
                        title: 'Approved Teams',
                        content: '${hospital.approvedTeams} teams',
                      ),
                      const SizedBox(height: 16),
                    ],
                    // Team Hospital Button
                    _buildTeamButton(context),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColor.primaryColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.style14B.copyWith(
                    color: AppColor.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: AppTextStyle.style16.copyWith(
                    color: AppColor.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          // Navigate to hospital team page
          // Using hospital.id as userId for the API call
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HospitalTeamPage(profileId: hospital.id),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          foregroundColor: AppColor.primaryColor,
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.groups,
              size: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              'Team Hospital',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
