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

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  late AppointmentBloc appointmentBloc;
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

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
    final formattedDate = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}';
    
    appointmentBloc.add(
      GetAppointmentsEvent(
        userId: 7, // You can make this dynamic based on user authentication
        appointmentDate: formattedDate,
      ),
    );
  }

  @override
  void dispose() {
    appointmentBloc.close();
    _dateController.dispose();
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
                        Text(
                          'Appointments',
                          style: AppTextStyle.style24B.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Date Picker
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColor.white.withOpacity(0.3),
                            ),
                          ),
                          child: TextField(
                            controller: _dateController,
                            readOnly: true,
                            onTap: _selectDate,
                            style: AppTextStyle.style16.copyWith(
                              color: AppColor.white,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Select Date',
                              hintStyle: AppTextStyle.style16.copyWith(
                                color: AppColor.white.withOpacity(0.7),
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: AppColor.white,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
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
                            subtitle: 'No appointments found for this date',
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
                        subtitle: 'Select a date to view appointments',
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

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.primaryColor,
              onPrimary: AppColor.white,
              surface: AppColor.white,
              onSurface: AppColor.black,
            ),
            dialogBackgroundColor: AppColor.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${picked.day} ${_getMonthName(picked.month)} ${picked.year}';
      });
      _loadAppointments();
    }
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}

