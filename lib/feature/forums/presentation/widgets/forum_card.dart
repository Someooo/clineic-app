import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/services/user_storage_service.dart';
import '../../domain/entities/forum_entity.dart';
import '../cubit/forums_cubit.dart';

class ForumCard extends StatelessWidget {
  final ForumEntity forum;

  const ForumCard({
    super.key,
    required this.forum,
  });

  void _showAnswerBottomSheet(BuildContext context) {
    final TextEditingController answerController = TextEditingController();
    final forumsCubit = context.read<ForumsCubit>();
    final userId = UserStorageService.instance.getUserId();
    bool isSubmitting = false;
    
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please login to view and post answers'),
          backgroundColor: AppColor.red,
        ),
      );
      return;
    }

    // Fetch answers first
    forumsCubit.getAnswers(forumId: forum.id, userId: userId);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (sheetContext) => StatefulBuilder(
        builder: (context, setState) {
          return StreamBuilder<ForumsState>(
            stream: forumsCubit.stream,
            initialData: forumsCubit.state,
            builder: (context, snapshot) {
              final state = snapshot.data!;
              
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Answers & Discussion',
                          style: AppTextStyle.style18B.copyWith(
                            color: AppColor.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(sheetContext).pop(),
                          icon: Icon(Icons.close, color: AppColor.grey),
                        ),
                      ],
                    ),
                    20.gap,
                    
                    // Loading state
                    if (state is ForumsLoading)
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    
                    // Error state
                    else if (state is ForumsError)
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.error, color: AppColor.red, size: 48.w),
                            16.gap,
                            Text(
                              'Error loading answers',
                              style: AppTextStyle.style16B.copyWith(
                                color: AppColor.red,
                              ),
                            ),
                            8.gap,
                            Text(
                              state.message,
                              style: AppTextStyle.style14.copyWith(
                                color: AppColor.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            16.gap,
                            ElevatedButton(
                              onPressed: () {
                                forumsCubit.getAnswers(forumId: forum.id, userId: userId);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                foregroundColor: AppColor.white,
                              ),
                              child: Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    
                    // Answers loaded state
                    else if (state is ForumsAnswersLoaded) ...[
                      // Answers section
                      if (state.answers.isNotEmpty) ...[
                        // Text(
                        //   'Existing Answers (${state.answers.length})',
                        //   style: AppTextStyle.style16B.copyWith(
                        //     color: AppColor.black,
                        //   ),
                        // ),
                        // 16.gap,
                        // Show all answers with scroll
                        Container(
                          constraints: BoxConstraints(maxHeight: 300.h),
                          child: SingleChildScrollView(
                            child: Column(
                              children: state.answers.map((answer) => Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 16.r,
                                            backgroundImage: NetworkImage(answer.userImage),
                                            child: answer.userImage.isEmpty
                                                ? Icon(Icons.person, size: 16.w)
                                                : null,
                                          ),
                                          8.gap,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  answer.userName,
                                                  style: AppTextStyle.style12B.copyWith(
                                                    color: AppColor.black,
                                                  ),
                                                ),
                                                if (answer.verifyUser == 1)
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.verified,
                                                        size: 12.w,
                                                        color: Colors.blue,
                                                      ),
                                                      2.gap,
                                                      Text(
                                                        'Verified',
                                                        style: AppTextStyle.style12.copyWith(
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      6.gap,
                                      Text(
                                        answer.answer,
                                        style: AppTextStyle.style12.copyWith(
                                          color: Colors.grey[700],
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              )).toList(),
                            ),
                          ),
                        ),
                        20.gap,
                      ] else ...[
                        Center(
                          child: Text(
                            'No answers yet. Be the first to answer!',
                            style: AppTextStyle.style14.copyWith(
                              color: AppColor.grey,
                            ),
                          ),
                        ),
                        20.gap,
                      ],
                      
                      // Post answer section
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          // color: AppColor.primaryColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColor.primaryColor.withOpacity(0.2)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Post Your Answer',
                              style: AppTextStyle.style16B.copyWith(
                                color: AppColor.primaryColor,
                              ),
                            ),
                            12.gap,
                            TextField(
                              controller: answerController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: 'Write your answer here...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(color: AppColor.grey.withOpacity(0.3)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(color: AppColor.primaryColor),
                                ),
                                contentPadding: EdgeInsets.all(12.w),
                              ),
                            ),
                            12.gap,
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: isSubmitting ? null : () async {
                                  if (answerController.text.trim().isEmpty) {
                                    ScaffoldMessenger.of(sheetContext).showSnackBar(
                                      SnackBar(
                                        content: Text('Please enter your answer'),
                                        backgroundColor: AppColor.red,
                                      ),
                                    );
                                    return;
                                  }

                                  setState(() {
                                    isSubmitting = true;
                                  });

                                  await forumsCubit.postAnswer(
                                    userId: userId,
                                    forumId: forum.id,
                                    forumAnswer: answerController.text.trim(),
                                  );

                                  // Clear the text field and refresh answers
                                  answerController.clear();
                                  forumsCubit.getAnswers(forumId: forum.id, userId: userId);
                                  forumsCubit.refreshForums(); // Refresh main forums list
                                  
                                  setState(() {
                                    isSubmitting = false;
                                  });

                                  ScaffoldMessenger.of(sheetContext).showSnackBar(
                                    SnackBar(
                                      content: Text('Answer posted successfully!'),
                                      backgroundColor: AppColor.green,
                                    ),
                                  );

                                  // Auto-close bottom sheet after successful post
                                  Navigator.of(sheetContext).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isSubmitting ? AppColor.grey : AppColor.primaryColor,
                                  foregroundColor: AppColor.white,
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                child: isSubmitting
                                    ? SizedBox(
                                        width: 16.w,
                                        height: 16.w,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(AppColor.white),
                                        ),
                                      )
                                    : Text(
                                        'Submit Answer',
                                        style: AppTextStyle.style14B,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    
                    // Fallback loading
                    if (state is! ForumsAnswersLoaded && state is! ForumsError && state is! ForumsLoading)
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    
                    20.gap,
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    ).then((_) {
      // Auto-refresh forums when bottom sheet closes
      forumsCubit.refreshForums();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsState>(
      listener: (context, state) {
        if (state is ForumsAnswerPosted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColor.green,
              duration: const Duration(seconds: 3),
            ),
          );
          // Refresh forums after posting answer
          context.read<ForumsCubit>().refreshForums();
        } else if (state is ForumsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColor.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with image and title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Forum image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        forum.image,
                        width: 60.w,
                        height: 60.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(
                              Icons.image,
                              size: 24.w,
                              color: Colors.grey[600],
                            ),
                          );
                        },
                      ),
                    ),
                    12.gap,
                    // Title and metadata
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            forum.title,
                            style: AppTextStyle.style16B.copyWith(
                              color: AppColor.black,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          8.gap,
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 14.w,
                                color: Colors.grey[600],
                              ),
                              4.gap,
                              Text(
                                forum.postDate,
                                style: AppTextStyle.style12.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              12.gap,
                              Icon(
                                Icons.comment,
                                size: 14.w,
                                color: Colors.grey[600],
                              ),
                              4.gap,
                              Text(
                                '${forum.answers} answers',
                                style: AppTextStyle.style12.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Answer icon - now opens unified bottom sheet
                    GestureDetector(
                      onTap: () => _showAnswerBottomSheet(context),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.question_answer,
                          size: 20.w,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                12.gap,
                // Content
                Text(
                  forum.content,
                  style: AppTextStyle.style14.copyWith(
                    color: Colors.grey[700],
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
