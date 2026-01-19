import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_hospital_doctors_usecase.dart';
import '../bloc/medical_provider_bloc.dart';
import '../bloc/medical_provider_event.dart';
import '../bloc/medical_provider_state.dart';
import '../widgets/medical_provider_list_widget.dart';

class AddBookingPage extends StatelessWidget {
  final GetHospitalDoctorsUseCase getHospitalDoctorsUseCase;

  const AddBookingPage({
    super.key,
    required this.getHospitalDoctorsUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Booking'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: BlocProvider(
        create: (context) => MedicalProviderBloc(
          getHospitalDoctorsUseCase: getHospitalDoctorsUseCase,
        )..add(const GetHospitalDoctorsEvent()),
        child: const AddBookingView(),
      ),
    );
  }
}

class AddBookingView extends StatelessWidget {
  const AddBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalProviderBloc, MedicalProviderState>(
      builder: (context, state) {
        if (state is MedicalProviderLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MedicalProviderLoaded) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.hospitals.isNotEmpty) ...[
                  const Text(
                    'Hospitals',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  MedicalProviderListWidget(providers: state.hospitals),
                  const SizedBox(height: 24),
                ],
                if (state.doctors.isNotEmpty) ...[
                  const Text(
                    'Doctors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  MedicalProviderListWidget(providers: state.doctors),
                ],
                if (state.hospitals.isEmpty && state.doctors.isEmpty)
                  const Center(
                    child: Text(
                      'No hospitals or doctors available',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else if (state is MedicalProviderError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.message}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<MedicalProviderBloc>().add(const GetHospitalDoctorsEvent());
                  },
                  child: const Text('Retry'),
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
