import '../../../../global_imports.dart';
import '../cubit/wishlist_get_cubit.dart';
import '../../../doctor_detail/presentation/widget/doctor_card.dart';
import '../../../doctor_detail/presentation/pages/doctor_detail_page.dart';
import '../../../doctor_detail/domain/entities/doctor_list_entity.dart';
import '../../../../core/widget/app_widget/custom_gradient_app_bar.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    super.initState();
    // Load wishlist when page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WishlistGetCubit>().getWishlist(
        profileId: 7, // You can get this from user session
        type: 'doctors',
      );
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
                child: BlocBuilder<WishlistGetCubit, WishlistGetState>(
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
                                context.read<WishlistGetCubit>().getWishlist(
                                  profileId: 7,
                                  type: 'doctors',
                                );
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
                            onBookmarkTap: () {
                              // Optionally implement remove from wishlist functionality
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Remove from favorites functionality can be implemented here'),
                                  backgroundColor: AppColor.primaryColor,
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
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
