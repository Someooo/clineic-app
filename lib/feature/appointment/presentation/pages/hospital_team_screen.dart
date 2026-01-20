import '../../../../global_imports.dart';
import '../../../../core/services/api.service.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import 'booking_form_screen.dart';

class HospitalTeamScreen extends StatefulWidget {
  final String hospitalName;
  final int profileId;

  const HospitalTeamScreen({
    super.key,
    required this.hospitalName,
    required this.profileId,
  });

  @override
  State<HospitalTeamScreen> createState() => _HospitalTeamScreenState();
}

class _HospitalTeamScreenState extends State<HospitalTeamScreen> {
  final ApiServices _apiServices = getIt<ApiServices>();
  List<TeamMember> _teamMembers = [];
  bool _isLoading = false;
  String? _error;
  TeamMember? _selectedDoctor;

  @override
  void initState() {
    super.initState();
    _fetchHospitalTeam();
  }

  Future<void> _fetchHospitalTeam() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await _apiServices.getData(
        '/api/v1/listing/get_hospital_team',
        queryParameters: {
          'profile_id': widget.profileId,
          'page_number': 1,
          'show_users': 10,
        },
      );

      // The API returns a direct array of team members
      if (response is List) {
        final List<dynamic> membersData = response;
        setState(() {
          _teamMembers = membersData.map((data) => TeamMember.fromJson(data)).toList();
        });
      } else {
        setState(() {
          _error = 'Unexpected response format';
        });
      }
    } on DioException catch (e) {
      setState(() {
        _error = 'Network error: ${e.message}';
      });
    } catch (e) {
      setState(() {
        _error = 'An error occurred: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
        body: Stack(
          children: [
            Column(
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
                      child: Row(
                        textDirection: Directionality.of(context),
                        children: [
                          if (Localizations.localeOf(context).languageCode == 'en')
                            Expanded(
                              child: Text(
                                '${widget.hospitalName} Team',
                                style: AppTextStyle.style24B.copyWith(
                                  color: AppColor.white,
                                  decoration: TextDecoration.none,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColor.white,
                              size: 28,
                            ),
                          ),
                          if (Localizations.localeOf(context).languageCode == 'ar')
                            Expanded(
                              child: Text(
                                '${widget.hospitalName} Team',
                                style: AppTextStyle.style24B.copyWith(
                                  color: AppColor.white,
                                  decoration: TextDecoration.none,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
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
                    child: _buildContent(),
                  ),
                ),
              ],
            ),
            // Forward Button
            if (_selectedDoctor != null)
              Positioned(
                bottom: 30,
                right: 20,
                child: GestureDetector(
                  onTap: _navigateToBookingForm,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primaryColor,
                      // gradient: LinearGradient(
                      //   colors: [AppColor.tealColor, AppColor.blueColor],
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColor.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            AppColor.primaryColor,
          ),
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColor.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Error',
              style: AppTextStyle.style20B.copyWith(
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: AppTextStyle.style14.copyWith(
                color: AppColor.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchHospitalTeam,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                foregroundColor: AppColor.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Try Again',
                style: AppTextStyle.style14B,
              ),
            ),
          ],
        ),
      );
    }

    if (_teamMembers.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 64,
              color: AppColor.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No team members available',
              style: TextStyle(
                fontSize: 16,
                color: AppColor.grey,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetchHospitalTeam,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _teamMembers.length,
        itemBuilder: (context, index) {
          final member = _teamMembers[index];
          return TeamMemberCard(
            member: member,
            isSelected: _selectedDoctor?.id == member.id,
            onTap: () {
              setState(() {
                _selectedDoctor = member;
              });
            },
          );
        },
      ),
    );
  }

  void _navigateToBookingForm() {
    if (_selectedDoctor != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingFormScreen(
            hospitalId: widget.profileId,
            doctorId: _selectedDoctor!.id,
            doctorName: _selectedDoctor!.name,
          ),
        ),
      );
    }
  }
}

class TeamMember {
  final int id;
  final String name;
  final String? imageUrl;
  final String? specialization;

  TeamMember({
    required this.id,
    required this.name,
    this.imageUrl,
    this.specialization,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      id: json['ID'] ?? json['id'] ?? 0,
      name: json['name'] ?? json['full_name'] ?? 'Unknown',
      imageUrl: json['image'] ?? json['avatar'],
      specialization: json['sub_heading'] ?? json['specialization'],
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;
  final bool isSelected;
  final VoidCallback onTap;

  const TeamMemberCard({
    super.key,
    required this.member,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(
                  color: AppColor.primaryColor,
                  width: 2,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Member Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.grey.withOpacity(0.2),
              ),
              child: ClipOval(
                child: member.imageUrl != null
                    ? Image.network(
                        member.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 30,
                            color: AppColor.grey,
                          );
                        },
                      )
                    : Icon(
                        Icons.person,
                        size: 30,
                        color: AppColor.grey,
                      ),
              ),
            ),
            const SizedBox(width: 16),
            // Member Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: AppTextStyle.style16B.copyWith(
                      color: AppColor.black,
                    ),
                  ),
                  if (member.specialization != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      member.specialization!,
                      style: AppTextStyle.style14.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Arrow Icon
            // Icon(
            //   Icons.arrow_forward_ios,
            //   size: 16,
            //   color: AppColor.grey,
            // ),
          ],
        ),
      ),
      )
    );
  }
}
