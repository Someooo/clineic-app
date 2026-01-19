import 'package:equatable/equatable.dart';

abstract class MedicalProviderEvent extends Equatable {
  const MedicalProviderEvent();

  @override
  List<Object> get props => [];
}

class GetHospitalDoctorsEvent extends MedicalProviderEvent {
  const GetHospitalDoctorsEvent();

  @override
  List<Object> get props => [];
}
