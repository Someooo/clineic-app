import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/wishlist_entity.dart';
import '../../domain/usecases/add_to_wishlist_usecase.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final AddToWishlistUseCase addToWishlistUseCase;

  WishlistCubit({required this.addToWishlistUseCase}) : super(WishlistInitial());

  Future<void> addToWishlist({
    required int userId,
    required int doctorId,
    required String column,
  }) async {
    emit(WishlistLoading());
    
    final result = await addToWishlistUseCase.call(
      userId: userId,
      doctorId: doctorId,
      column: column,
    );

    result.fold(
      (failure) => emit(WishlistError(message: failure.message)),
      (wishlistEntity) => emit(WishlistLoaded(wishlistEntity: wishlistEntity)),
    );
  }
}
