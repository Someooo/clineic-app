import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_hospital_doctors_usecase.dart';
import '../../domain/entities/medical_provider_entity.dart';
import '../bloc/medical_provider_bloc.dart';
import '../bloc/medical_provider_event.dart';
import '../bloc/medical_provider_state.dart';
import '../widgets/medical_provider_list_widget.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import 'hospital_team_screen.dart';

class AddBookingPage extends StatelessWidget {
  final GetHospitalDoctorsUseCase getHospitalDoctorsUseCase;

  const AddBookingPage({
    super.key,
    required this.getHospitalDoctorsUseCase,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Booking',
                        style: AppTextStyle.style24B.copyWith(
                          color: AppColor.white,
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
                child: BlocProvider(
                  create: (context) => MedicalProviderBloc(
                    getHospitalDoctorsUseCase: getHospitalDoctorsUseCase,
                  )..add(const GetHospitalDoctorsEvent()),
                  child: const AddBookingView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddBookingView extends StatefulWidget {
  const AddBookingView({super.key});

  @override
  State<AddBookingView> createState() => _AddBookingViewState();
}

class _AddBookingViewState extends State<AddBookingView> {
  MedicalProviderEntity? _selectedProvider;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalProviderBloc, MedicalProviderState>(
      builder: (context, state) {
        if (state is MedicalProviderLoading) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColor.primaryColor,
              ),
            ),
          );
        } else if (state is MedicalProviderLoaded) {
          return Stack(
            children: [
              // Main content
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 100, // Extra padding to avoid overlap with floating button
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.hospitals.isNotEmpty) ...[
                      Text(
                        'Hospitals',
                        style: AppTextStyle.style18B.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                      MedicalProviderListWidget(
                        providers: state.hospitals,
                        selectedProvider: _selectedProvider,
                        onProviderSelected: (provider) {
                          setState(() {
                            _selectedProvider = (_selectedProvider?.id == provider.id) ? null : provider;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                    if (state.doctors.isNotEmpty) ...[
                      Text(
                        'Doctors',
                        style: AppTextStyle.style18B.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                      MedicalProviderListWidget(
                        providers: state.doctors,
                        selectedProvider: _selectedProvider,
                        onProviderSelected: (provider) {
                          setState(() {
                            _selectedProvider = (_selectedProvider?.id == provider.id) ? null : provider;
                          });
                        },
                      ),
                    ],
                    if (state.hospitals.isEmpty && state.doctors.isEmpty)
                      const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: AppColor.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No hospitals or doctors available',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              // Floating Action Button
              Positioned(
                bottom: 20,
                right: 20,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  child: _selectedProvider != null && _selectedProvider!.isHospital
                      ? FloatingActionButton(
                          key: const ValueKey('fab_visible'),
                          onPressed: () {
                            // Navigate to hospital team screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HospitalTeamScreen(
                                  hospitalName: _selectedProvider!.fullName,
                                  profileId: _selectedProvider!.id,
                                ),
                              ),
                            );
                          },
                          backgroundColor: AppColor.primaryColor,
                          elevation: 8,
                          child: const Icon(
                            Icons.arrow_forward,
                            color: AppColor.white,
                            size: 24,
                          ),
                        )
                      : const SizedBox.shrink(key: ValueKey('fab_hidden')),
                ),
              ),
            ],
          );
        } else if (state is MedicalProviderError) {
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
                  state.message,
                  style: AppTextStyle.style14.copyWith(
                    color: AppColor.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<MedicalProviderBloc>().add(const GetHospitalDoctorsEvent());
                  },
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
        return const SizedBox.shrink();
      },
    );
  }
}
