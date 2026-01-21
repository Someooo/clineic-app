import '../../../../global_imports.dart';
import '../cubit/doctor_list_cubit.dart';
import 'doctor_detail_page.dart';
import '../widget/doctor_card.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  final Set<int> _bookmarkedDoctors = {};
  int? _lastBookmarkedDoctorId;
  static const String _bookmarkedDoctorsKey = 'bookmarked_doctors';

  @override
  void initState() {
    super.initState();
    _loadBookmarkedDoctors();
  }

  Future<void> _loadBookmarkedDoctors() async {
    try {
      final box = getIt<Box>(instanceName: BoxKey.appBox);
      final bookmarkedData = box.get(_bookmarkedDoctorsKey);
      if (bookmarkedData != null) {
        final List<dynamic> bookmarkedList = bookmarkedData;
        setState(() {
          _bookmarkedDoctors.addAll(bookmarkedList.cast<int>());
        });
      }
    } catch (e) {
      logger.e('Error loading bookmarked doctors: $e');
    }
  }

  Future<void> _saveBookmarkedDoctors() async {
    try {
      final box = getIt<Box>(instanceName: BoxKey.appBox);
      await box.put(_bookmarkedDoctorsKey, _bookmarkedDoctors.toList());
    } catch (e) {
      logger.e('Error saving bookmarked doctors: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<WishlistCubit>(),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColor.tealColor, AppColor.blueColor],
          ),
        ),
        child: Column(
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
                        'Doctor List',
                        style: AppTextStyle.style24B.copyWith(
                          color: AppColor.white,
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BlocBuilder<DoctorListCubit, DoctorListState>(
                    builder: (context, state) {
                      if (state.status == 'loading') {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state.status == 'error') {
                        return Center(
                          child: Text(
                            state.message ?? AppLocalizations.of(context)!.error,
                            style: AppTextStyle.style14.copyWith(
                              color: AppColor.red,
                            ),
                          ),
                        );
                      }

                      final doctors = state.doctors;

                      if (doctors.isEmpty) {
                        return const NoDataWidget(
                          title: 'No favorites yet',
                          subtitle: 'Start adding your favorite doctors',
                        );
                      }

                      return ListView.builder(
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          final doctor = doctors[index];
                          final isBookmarked = _bookmarkedDoctors.contains(doctor.id);

                          return BlocConsumer<WishlistCubit, WishlistState>(
                            listener: (context, wishlistState) {
                              if (wishlistState is WishlistLoaded && _lastBookmarkedDoctorId == doctor.id) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(wishlistState.wishlistEntity.message),
                                    backgroundColor: AppColor.primaryColor,
                                    duration: const Duration(seconds: 4),
                                  ),
                                );
                                // Reset the last bookmarked doctor ID
                                _lastBookmarkedDoctorId = null;
                              } else if (wishlistState is WishlistError && _lastBookmarkedDoctorId == doctor.id) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(wishlistState.message),
                                    backgroundColor: AppColor.red,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                                // Reset the last bookmarked doctor ID
                                _lastBookmarkedDoctorId = null;
                              }
                            },
                            builder: (context, wishlistState) {
                              return DoctorCard(
                                doctor: doctor,
                                isBookmarked: isBookmarked,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (context) => DoctorDetailPage(
                                            doctorId: doctor.id,
                                            doctorName: doctor.fullName,
                                          ),
                                    ),
                                  );
                                },
                                onBookmarkTap: () async {
                                  // Update bookmark state immediately for better UX
                                  setState(() {
                                    _bookmarkedDoctors.add(doctor.id);
                                    _lastBookmarkedDoctorId = doctor.id;
                                  });
                                  
                                  // Save to persistent storage
                                  await _saveBookmarkedDoctors();
                                  
                                  // Call API
                                  await context.read<WishlistCubit>().addToWishlist(
                                    userId: 7, // You can get this from user session
                                    doctorId: doctor.id,
                                    column: 'saved_doctors',
                                  );
                                },
                                onRemoveFromWishlist: (doctorId) async {
                                  // Update bookmark state immediately for better UX
                                  setState(() {
                                    _bookmarkedDoctors.remove(doctorId);
                                    _lastBookmarkedDoctorId = doctorId;
                                  });
                                  
                                  // Save to persistent storage
                                  await _saveBookmarkedDoctors();
                                  
                                  // Call API
                                  await context.read<WishlistCubit>().removeFromWishlist(
                                    userId: 7, // You can get this from user session
                                    doctorId: doctorId,
                                    column: 'saved_doctors',
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
