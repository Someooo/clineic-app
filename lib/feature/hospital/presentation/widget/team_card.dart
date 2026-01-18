import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../global_imports.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import '../../domain/entities/team_entity.dart';

class TeamCard extends StatelessWidget {
  final TeamEntity team;
  final bool isBookmarked;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  const TeamCard({
    super.key,
    required this.team,
    this.isBookmarked = false,
    this.onTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        team.name,
                        style: AppTextStyle.style18B.copyWith(
                          color: AppColor.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        team.status,
                        style: AppTextStyle.style14.copyWith(
                          color: AppColor.grey,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
             
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoBadge(
                  label: AppLocalizations.of(context)!.status,
                  value: team.status,
                ),
                const SizedBox(width: 8),
                _buildInfoBadge(
                  label: 'ID',
                  value: team.id.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBadge({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: AppTextStyle.style12.copyWith(
              color: AppColor.grey,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            value,
            style: AppTextStyle.style12.copyWith(
              color: AppColor.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
