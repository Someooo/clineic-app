import '../../../global_imports.dart';
import '../data/datasource/wishlist_remote_datasource.dart';
import '../data/datasource/wishlist_get_remote_datasource.dart';
import '../data/repository/wishlist_repository_impl.dart';
import '../data/repository/wishlist_get_repository_impl.dart';
import '../domain/repository/wishlist_repository.dart';
import '../domain/repository/wishlist_get_repository.dart';
import '../domain/usecases/add_to_wishlist_usecase.dart';
import '../domain/usecases/get_wishlist_usecase.dart';
import '../presentation/cubit/wishlist_cubit.dart';
import '../presentation/cubit/wishlist_get_cubit.dart';

void wishlistDI() {
  // Data layer
  getIt.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSourceImpl(apiServices: getIt()),
  );

  getIt.registerLazySingleton<WishlistGetRemoteDataSource>(
    () => WishlistGetRemoteDataSourceImpl(apiServices: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  getIt.registerLazySingleton<WishlistGetRepository>(
    () => WishlistGetRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton<AddToWishlistUseCase>(
    () => AddToWishlistUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<GetWishlistUseCase>(
    () => GetWishlistUseCase(repository: getIt()),
  );

  // Cubit
  getIt.registerFactory<WishlistCubit>(
    () => WishlistCubit(addToWishlistUseCase: getIt()),
  );

  getIt.registerFactory<WishlistGetCubit>(
    () => WishlistGetCubit(getWishlistUseCase: getIt()),
  );
}
