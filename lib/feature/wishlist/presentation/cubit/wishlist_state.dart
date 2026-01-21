part of 'wishlist_cubit.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final WishlistEntity wishlistEntity;

  WishlistLoaded({required this.wishlistEntity});
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError({required this.message});
}
