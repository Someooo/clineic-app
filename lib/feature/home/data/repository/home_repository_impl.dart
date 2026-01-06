import '../../../../global_imports.dart';
import '../../domain/repository/home_repository.dart';
import '../datasource/home_remote_data_source.dart';
import '../datasource/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;
  final HomeLocalDataSource local;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.networkInfo,
    required this.remote,
    required this.local,
  });

  // TODO: Implement repository methods
  // Example:
  // @override
  // Future<Either<Failure, ApiResponse<HomeEntity>>> getHomeData({
  //   required DataSource dataSource,
  //   required CancelToken cancelToken,
  // }) async {
  //   try {
  //     // Implementation here
  //   } catch (e, t) {
  //     return handleRepoDataError(e, t);
  //   }
  // }
}
