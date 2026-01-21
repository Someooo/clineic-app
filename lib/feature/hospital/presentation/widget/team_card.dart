import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../global_imports.dart';
import '../../domain/entities/team_entity.dart';
import '../pages/team_member_profile_page.dart';
import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';
import '../../../../core/services/user_storage_service.dart';

class TeamCard extends StatefulWidget {
  final TeamEntity team;
  final VoidCallback? onTap;

  const TeamCard({
    super.key,
    required this.team,
    this.onTap,
  });

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  final Set<int> _bookmarkedTeamMembers = {};
  static const String _bookmarkedTeamMembersKey = 'bookmarked_team_members';

  @override
  void initState() {
    super.initState();
    _loadBookmarkedTeamMembers();
  }

  Future<void> _loadBookmarkedTeamMembers() async {
    try {
      final box = getIt<Box>(instanceName: BoxKey.appBox);
      final bookmarkedData = box.get(_bookmarkedTeamMembersKey);
      if (bookmarkedData != null) {
        final List<dynamic> bookmarkedList = bookmarkedData;
        setState(() {
          _bookmarkedTeamMembers.addAll(bookmarkedList.cast<int>());
        });
      }
    } catch (e) {
      logger.e('Error loading bookmarked team members: $e');
    }
  }

  Future<void> _saveBookmarkedTeamMembers() async {
    try {
      final box = getIt<Box>(instanceName: BoxKey.appBox);
      await box.put(_bookmarkedTeamMembersKey, _bookmarkedTeamMembers.toList());
    } catch (e) {
      logger.e('Error saving bookmarked team members: $e');
    }
  }

  Future<void> _toggleBookmark() async {
    final isBookmarked = _bookmarkedTeamMembers.contains(widget.team.id);
    final userId = UserStorageService.instance.getUserId();
    
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please login to manage favorites'),
          backgroundColor: AppColor.red,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }
    
    if (isBookmarked) {
      // Remove from wishlist
      setState(() {
        _bookmarkedTeamMembers.remove(widget.team.id);
      });
      
      // Call API to remove from wishlist
      await context.read<WishlistCubit>().removeFromWishlist(
        userId: userId,
        doctorId: widget.team.id,
        column: 'saved_doctors',
      );
    } else {
      // Add to wishlist
      setState(() {
        _bookmarkedTeamMembers.add(widget.team.id);
      });
      
      // Call API to add to wishlist
      await context.read<WishlistCubit>().addToWishlist(
        userId: userId,
        doctorId: widget.team.id,
        column: 'saved_doctors',
      );
    }
    
    await _saveBookmarkedTeamMembers();
  }

  @override
  Widget build(BuildContext context) {
    final isBookmarked = _bookmarkedTeamMembers.contains(widget.team.id);
    
    return GestureDetector(
      onTap: widget.onTap ?? () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TeamMemberProfilePage(teamMember: widget.team),
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
                  widget.team.image.isNotEmpty
                      ? NetworkImage(widget.team.image)
                      : null,
              child:
                  widget.team.image.isEmpty
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
                widget.team.name,
                style: AppTextStyle.style18B.copyWith(
                  color: AppColor.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: _toggleBookmark,
              child: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark,
                color: isBookmarked ? AppColor.primaryColor : AppColor.grey,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
