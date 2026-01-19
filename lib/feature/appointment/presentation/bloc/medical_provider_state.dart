import 'package:equatable/equatable.dart';
import '../../domain/entities/medical_provider_entity.dart';

abstract class MedicalProviderState extends Equatable {
  const MedicalProviderState();

  @override
  List<Object> get props => [];
}

class MedicalProviderInitial extends MedicalProviderState {}

class MedicalProviderLoading extends MedicalProviderState {}

class MedicalProviderLoaded extends MedicalProviderState {
  final List<MedicalProviderEntity> hospitals;
  final List<MedicalProviderEntity> doctors;

  const MedicalProviderLoaded({
    required this.hospitals,
    required this.doctors,
  });

  @override
  List<Object> get props => [hospitals, doctors];
}

class MedicalProviderError extends MedicalProviderState {
  final String message;

  const MedicalProviderError(this.message);

  @override
  List<Object> get props => [message];
}
