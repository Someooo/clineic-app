part of 'wishlist_get_cubit.dart';

abstract class WishlistGetState {}

class WishlistGetInitial extends WishlistGetState {}

class WishlistGetLoading extends WishlistGetState {}

class WishlistGetLoaded extends WishlistGetState {
  final List<WishlistDoctorEntity> wishlistDoctors;

  WishlistGetLoaded({required this.wishlistDoctors});
}

class WishlistGetError extends WishlistGetState {
  final String message;

  WishlistGetError({required this.message});
}
