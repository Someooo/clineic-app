import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../global_imports.dart';
import '../../domain/entities/wishlist_doctor_entity.dart';
import '../../domain/usecases/get_wishlist_usecase.dart';

part 'wishlist_get_state.dart';

class WishlistGetCubit extends Cubit<WishlistGetState> {
  final GetWishlistUseCase getWishlistUseCase;

  WishlistGetCubit({required this.getWishlistUseCase}) : super(WishlistGetInitial());

  Future<void> getWishlist({
    required int profileId,
    required String type,
  }) async {
    logger.i('Cubit: Starting wishlist fetch');
    emit(WishlistGetLoading());
    
    final result = await getWishlistUseCase.call(
      profileId: profileId,
      type: type,
    );

    result.fold(
      (failure) {
        logger.e('Cubit: Error loading wishlist - ${failure.message}');
        emit(WishlistGetError(message: failure.message));
      },
      (wishlistDoctors) {
        logger.i('Cubit: Successfully loaded ${wishlistDoctors.length} wishlist doctors');
        emit(WishlistGetLoaded(wishlistDoctors: wishlistDoctors));
      },
    );
  }
}
