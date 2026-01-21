import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../global_imports.dart';
import '../../domain/entities/team_entity.dart';
import '../pages/team_member_profile_page.dart';

class TeamCard extends StatelessWidget {
  final TeamEntity team;
  final VoidCallback? onTap;

  const TeamCard({
    super.key,
    required this.team,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TeamMemberProfilePage(teamMember: team),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: AppColor.grey.withOpacity(0.2),
              backgroundImage:
                  team.image.isNotEmpty
                      ? NetworkImage(team.image)
                      : null,
              child:
                  team.image.isEmpty
                      ? Icon(
                          Icons.person,
                          color: AppColor.tealColor,
                          size: 32,
                        )
                      : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                team.name,
                style: AppTextStyle.style18B.copyWith(
                  color: AppColor.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          const  Icon(
              Icons.bookmark_outlined,
              color: AppColor.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
