import '../../../../global_imports.dart';
import '../../../../core/widget/app_widget/custom_gradient_app_bar.dart';
import '../../domain/entities/team_entity.dart';

class TeamMemberProfilePage extends StatelessWidget {
  final TeamEntity teamMember;

  const TeamMemberProfilePage({
    super.key,
    required this.teamMember,
  });

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              CustomGradientAppBar(
                title: 'Team Member Profile',
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
                          // Add Appointment Button
                        // AppButton.text(
                        //   text: 'Add Appointment',
                        //   onPressed: () {
                        //     // TODO: Add appointment logic
                        //   },
                        //   color: Colors.blue,
                        // ),
                        //  const SizedBox(height: 14),
                        // Profile Header
                        _buildProfileHeader(),
                        const SizedBox(height: 24),
                        // Info Sections
                        _buildInfoSection(
                          icon: Icons.person,
                          title: 'Full Name',
                          content: teamMember.name,
                        ),
                        const SizedBox(height: 16),
                        _buildInfoSection(
                          icon: Icons.verified_user,
                          title: 'Verification Status',
                          content: teamMember.isVerified == 'yes' ? 'Verified' : 'Not Verified',
                        ),
                        const SizedBox(height: 16),
                        if (teamMember.medicalVerified == 'yes')
                          _buildInfoSection(
                            icon: Icons.medical_services,
                            title: 'Medical Verification',
                            content: 'Medically Verified',
                          ),
                        if (teamMember.medicalVerified == 'yes') const SizedBox(height: 16),
                        _buildInfoSection(
                          icon: Icons.star,
                          title: 'Rating',
                          content: teamMember.averageRating ?? 'No rating',
                        ),
                        const SizedBox(height: 16),
                        _buildInfoSection(
                          icon: Icons.how_to_vote,
                          title: 'Total Rating',
                          content: teamMember.totalRating,
                        ),
                        const SizedBox(height: 16),
                        if (teamMember.bookingsDays.isNotEmpty) ...[
                          _buildBookingsDaysSection(),
                          const SizedBox(height: 16),
                        ],
                        if (teamMember.specialities.isNotEmpty)
                          _buildSpecialitiesSection(),
                        // const SizedBox(height: 24),
                      
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColor.grey.withOpacity(0.2),
            backgroundImage:
                teamMember.image.isNotEmpty
                    ? NetworkImage(teamMember.image)
                    : null,
            child:
                teamMember.image.isEmpty
                    ? Icon(
                        Icons.person,
                         color: Colors.blue,
                        size: 40,
                      )
                    : null,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teamMember.name,
                  style: AppTextStyle.style20B.copyWith(
                    color: AppColor.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: teamMember.isVerified == 'yes'
                        ? Colors.green.withOpacity(0.1)
                        : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    teamMember.isVerified == 'yes' ? 'Verified' : 'Pending',
                    style: AppTextStyle.style12.copyWith(
                      color: teamMember.isVerified == 'yes'
                          ? Colors.green
                          : Colors.orange,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
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
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColor.tealColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.style12.copyWith(
                    color: AppColor.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: AppTextStyle.style14.copyWith(
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

  Widget _buildBookingsDaysSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.tealColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.calendar_today,
                   color: Colors.blue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Available Days',
                style: AppTextStyle.style14B.copyWith(
                  color: AppColor.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: teamMember.bookingsDays.map((day) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: teamMember.currentDay.toLowerCase() == day.toLowerCase()
                      ?  Colors.blue
                      : AppColor.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  day,
                  style: AppTextStyle.style12.copyWith(
                    color: teamMember.currentDay.toLowerCase() == day.toLowerCase()
                        ? AppColor.white
                        : AppColor.black,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialitiesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.tealColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.work,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Specialities',
                style: AppTextStyle.style14B.copyWith(
                  color: AppColor.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            teamMember.specialities.isNotEmpty
                ? teamMember.specialities
                : 'No specialities listed',
            style: AppTextStyle.style14.copyWith(
              color: AppColor.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
