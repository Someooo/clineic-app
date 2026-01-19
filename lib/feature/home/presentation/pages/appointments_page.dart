import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/status_widget/no_data_widget.dart';
import '../../../appointment/data/datasources/appointment_remote_data_source.dart';
import '../../../appointment/data/repositories/appointment_repository_impl.dart';
import '../../../appointment/domain/usecases/get_appointments_usecase.dart';
import '../../../appointment/presentation/bloc/appointment_bloc.dart';
import '../../../appointment/presentation/bloc/appointment_event.dart';
import '../../../appointment/presentation/bloc/appointment_state.dart';
import '../../../appointment/presentation/widgets/appointment_card.dart';
import '../../../appointment/presentation/widgets/add_appointment_icon.dart';
import '../../../../core/widget/segmented_control/app_segmented_control.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  late AppointmentBloc appointmentBloc;
  String _selectedStatus = 'Pending';

  @override
  void initState() {
    super.initState();
    _initializeBloc();
    _loadAppointments();
  }

  void _initializeBloc() {
    final remoteDataSource = AppointmentRemoteDataSourceImpl(
      client: http.Client(),
    );
    final repository = AppointmentRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
    final getAppointmentsUseCase = GetAppointmentsUseCase(
      repository: repository,
    );

    appointmentBloc = AppointmentBloc(
      getAppointmentsUseCase: getAppointmentsUseCase,
    );
  }

  void _loadAppointments() {
    appointmentBloc.add(
      GetAppointmentsEvent(
        userId: 7, // You can make this dynamic based on user authentication
        status: _selectedStatus,
      ),
    );
  }

  @override
  void dispose() {
    appointmentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appointmentBloc,
      child: Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Appointments',
                              style: AppTextStyle.style24B.copyWith(
                                color: AppColor.white,
                              ),
                            ),
                            AddAppointmentIcon(
                              onPressed: () {
                                // TODO: Add appointment logic
                              },
                              iconSize: 28,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Status Filter
                        AppSegmentedControl<String>(
                          groupValue: _selectedStatus,
                          onValueChanged: (String? value) {
                            if (value != null) {
                              setState(() {
                                _selectedStatus = value;
                              });
                              _loadAppointments();
                            }
                          },
                          children: {
                            'Pending': Text(
                              'Pending',
                              style: TextStyle(
                                color: _selectedStatus == 'Pending' 
                                  ? AppColor.primaryColor 
                                  : AppColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          
                            'In Progress': Text(
                              'In Progress',
                              style: TextStyle(
                                color: _selectedStatus == 'In Progress' 
                                  ? AppColor.primaryColor 
                                  : AppColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                              'Accepted': Text(
                              'Accepted',
                              style: TextStyle(
                                color: _selectedStatus == 'Accepted' 
                                  ? AppColor.primaryColor 
                                  : AppColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          },
                          backgroundColor: AppColor.white.withOpacity(0.2),
                          thumbColor: AppColor.white,
                          height: 40,
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
                  child: BlocBuilder<AppointmentBloc, AppointmentState>(
                    builder: (context, state) {
                      if (state is AppointmentLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColor.primaryColor,
                            ),
                          ),
                        );
                      } else if (state is AppointmentLoaded) {
                        if (state.appointments.isEmpty) {
                          return const NoDataWidget(
                            title: 'No appointments',
                            subtitle: 'No appointments found',
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            _loadAppointments();
                          },
                          child: ListView.builder(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom:65,
                            ),
                            itemCount: state.appointments.length,
                            itemBuilder: (context, index) {
                              return AppointmentCard(
                                appointment: state.appointments[index],
                              );
                            },
                          ),
                        );
                      } else if (state is AppointmentError) {
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
                                onPressed: _loadAppointments,
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
                      return const NoDataWidget(
                        title: 'No appointments',
                        subtitle: 'No appointments found for this status',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

