import '../../../../global_imports.dart';
import '../cubit/wishlist_get_cubit.dart';
import '../cubit/wishlist_cubit.dart';
import '../../../doctor_detail/presentation/widget/doctor_card.dart';
import '../../../doctor_detail/presentation/pages/doctor_detail_page.dart';
import '../../../doctor_detail/domain/entities/doctor_list_entity.dart';
import '../../../../core/widget/app_widget/custom_gradient_app_bar.dart';
import '../../../../core/services/user_storage_service.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    super.initState();
    
    // Get the logged-in user's ID dynamically
    final userId = UserStorageService.instance.getUserId();
    if (userId != null) {
      // Load wishlist for the current user
      context.read<WishlistGetCubit>().getWishlist(
        profileId: userId,
        type: 'doctors',
      );
    } else {
      // Handle case where user is not logged in
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please login to view your favorites'),
            backgroundColor: AppColor.red,
            duration: const Duration(seconds: 3),
          ),
        );
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
      child: Column(
        children: [
          // Header Section using CustomGradientAppBar
          CustomGradientAppBar(
            title: 'My Favorites',
            showBackButton: true,
            
            onBackPressed: () => Navigator.of(context).pop(),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocConsumer<WishlistCubit, WishlistState>(
                  listener: (context, wishlistState) {
                    if (wishlistState is WishlistLoaded) {
                      // Show success message for add/remove operations
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(wishlistState.wishlistEntity.message),
                          backgroundColor: AppColor.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    } else if (wishlistState is WishlistError) {
                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(wishlistState.message),
                          backgroundColor: AppColor.red,
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  builder: (context, wishlistState) {
                    return BlocBuilder<WishlistGetCubit, WishlistGetState>(
                      builder: (context, state) {
                    if (state is WishlistGetLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is WishlistGetError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error loading favorites',
                              style: AppTextStyle.style18B.copyWith(
                                color: AppColor.red,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.message,
                              style: AppTextStyle.style14.copyWith(
                                color: AppColor.grey,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                final userId = UserStorageService.instance.getUserId();
                                if (userId != null) {
                                  context.read<WishlistGetCubit>().getWishlist(
                                    profileId: userId,
                                    type: 'doctors',
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please login to view your favorites'),
                                      backgroundColor: AppColor.red,
                                      duration: const Duration(seconds: 3),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                foregroundColor: AppColor.white,
                              ),
                              child: const Text('Try Again'),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is WishlistGetLoaded) {
                      final wishlistDoctors = state.wishlistDoctors;

                      if (wishlistDoctors.isEmpty) {
                        return const NoDataWidget(
                          title: 'No favorites yet',
                          subtitle: 'Start adding your favorite doctors',
                        );
                      }

                      return ListView.builder(
                        itemCount: wishlistDoctors.length,
                        itemBuilder: (context, index) {
                          final doctor = wishlistDoctors[index];
                          
                          // Convert to DoctorListEntity for compatibility with DoctorCard
                          final doctorEntity = DoctorListEntity(
                            id: doctor.id,
                            fullName: doctor.name,
                            subHeading: doctor.subheading,
                            avatar: doctor.image,
                            averageRating: doctor.averageRating,
                            totalRating: int.tryParse(doctor.totalRating) ?? 0,
                            location: null,
                            specialities: doctor.specialities,
                            services: null,
                            availableDays: null,
                            startingPrice: null,
                            votes: null,
                            workingTime: null,
                          );

                          return DoctorCard(
                            doctor: doctorEntity,
                            isBookmarked: true, // All items in wishlist are bookmarked
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DoctorDetailPage(
                                    doctorId: doctor.id,
                                    doctorName: doctor.name,
                                  ),
                                ),
                              );
                            },
                            onRemoveFromWishlist: (doctorId) async {
                              final userId = UserStorageService.instance.getUserId();
                              if (userId != null) {
                                // Call the remove from wishlist API
                                await context.read<WishlistCubit>().removeFromWishlist(
                                  userId: userId,
                                  doctorId: doctorId,
                                  column: 'saved_doctors',
                                );
                                
                                // Refresh the wishlist after removal
                                context.read<WishlistGetCubit>().getWishlist(
                                  profileId: userId,
                                  type: 'doctors',
                                );
                                
                                // Show success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Removed from favorites'),
                                    backgroundColor: AppColor.green,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please login to remove favorites'),
                                    backgroundColor: AppColor.red,
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
