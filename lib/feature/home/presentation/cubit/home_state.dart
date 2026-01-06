part of 'home_cubit.dart';

// TODO: Uncomment and configure when ready (requires freezed setup)
// @freezed
// class HomeState with _$HomeState {
//   const factory HomeState.initial() = HomeInitial;
//   const factory HomeState.loading() = HomeLoading;
//   const factory HomeState.loaded(HomeEntity data, String message) = HomeLoaded;
//   const factory HomeState.error({required String message, String? title}) = HomeError;
// }

// Placeholder - replace with actual state when using freezed
class HomeState {
  final String status;
  final String? message;
  final dynamic data;

  const HomeState({
    required this.status,
    this.message,
    this.data,
  });

  static const HomeState initial = HomeState(status: 'initial');
  static const HomeState loading = HomeState(status: 'loading');
  
  static HomeState loaded(dynamic data, String message) {
    return HomeState(status: 'loaded', data: data, message: message);
  }
  
  static HomeState error({required String message, String? title}) {
    return HomeState(status: 'error', message: message);
  }
}
