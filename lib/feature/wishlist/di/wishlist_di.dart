import '../../../global_imports.dart';
import '../data/datasource/wishlist_remote_datasource.dart';
import '../data/repository/wishlist_repository_impl.dart';
import '../domain/repository/wishlist_repository.dart';
import '../domain/usecases/add_to_wishlist_usecase.dart';
import '../presentation/cubit/wishlist_cubit.dart';

void wishlistDI() {
  // Data layer
  getIt.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSourceImpl(apiServices: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton<AddToWishlistUseCase>(
    () => AddToWishlistUseCase(repository: getIt()),
  );

  // Cubit
  getIt.registerFactory<WishlistCubit>(
    () => WishlistCubit(addToWishlistUseCase: getIt()),
  );
}
