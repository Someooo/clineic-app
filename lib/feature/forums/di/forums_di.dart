import 'package:get_it/get_it.dart';
import '../../../global_imports.dart';
import '../data/datasource/forums_remote_data_source.dart';
import '../data/datasource/forums_remote_data_source_impl.dart';
import '../data/repository/forums_repository_impl.dart';
import '../domain/repository/forums_repository.dart';
import '../domain/usecases/get_forums_listing_usecase.dart';
import '../presentation/cubit/forums_cubit.dart';

Future<void> forumsDI(GetIt getIt) async {
  // Data layer
  getIt.registerLazySingleton<ForumsRemoteDataSource>(
    () => ForumsRemoteDataSourceImpl(getIt<ApiServices>()),
  );

  getIt.registerLazySingleton<ForumsRepository>(
    () => ForumsRepositoryImpl(remoteDataSource: getIt<ForumsRemoteDataSource>()),
  );

  // Domain layer
  getIt.registerLazySingleton<GetForumsListingUseCase>(
    () => GetForumsListingUseCase(repository: getIt<ForumsRepository>()),
  );

  // Presentation layer
  getIt.registerFactory<ForumsCubit>(
    () => ForumsCubit(getForumsListingUseCase: getIt<GetForumsListingUseCase>()),
  );
}
