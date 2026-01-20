import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../global_imports.dart';
import '../cubit/forums_cubit.dart';
import '../widgets/forum_card.dart';

class ForumsPage extends StatefulWidget {
  const ForumsPage({super.key});

  @override
  State<ForumsPage> createState() => _ForumsPageState();
}

class _ForumsPageState extends State<ForumsPage> {
  @override
  void initState() {
    super.initState();
    // Load forums when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ForumsCubit>().loadForums();
    });
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
        body: Column(
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
                        'Forums',
                        style: AppTextStyle.style24B.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                      const SizedBox(height: 16),
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
                child: BlocBuilder<ForumsCubit, ForumsState>(
                  builder: (context, state) {
                    if (state is ForumsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColor.primaryColor,
                          ),
                        ),
                      );
                    } else if (state is ForumsError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64.w,
                              color: Colors.red[400],
                            ),
                            16.gap,
                            Text(
                              'Error loading forums',
                              style: AppTextStyle.style20B.copyWith(
                                color: Colors.red[600],
                              ),
                            ),
                            8.gap,
                            Text(
                              state.message,
                              style: AppTextStyle.style14.copyWith(
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            16.gap,
                            ElevatedButton(
                              onPressed: () {
                                context.read<ForumsCubit>().refreshForums();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 12.h,
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
                    } else if (state is ForumsLoaded) {
                      if (state.forums.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.forum_outlined,
                                size: 64.w,
                                color: Colors.grey[400],
                              ),
                              16.gap,
                              Text(
                                'No forums available',
                                style: AppTextStyle.style20B.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              8.gap,
                              Text(
                                'Check back later for new discussions',
                                style: AppTextStyle.style14.copyWith(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<ForumsCubit>().refreshForums();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            top: 16.h,
                            bottom: 60.h, // Added extra space below last card
                          ),
                          itemCount: state.forums.length,
                          itemBuilder: (context, index) {
                            final forum = state.forums[index];
                            return ForumCard(forum: forum);
                          },
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
