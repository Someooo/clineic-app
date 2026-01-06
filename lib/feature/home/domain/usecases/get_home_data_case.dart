import '../../../../global_imports.dart';
import '../entities/home_entity.dart';
import '../repository/home_repository.dart';

class GetHomeDataCase {
  final HomeRepository repository;

  GetHomeDataCase(this.repository);

  Future<Either<Failure, ApiResponse<HomeEntity>>> call({
    required CancelToken cancelToken,
  }) {
    // TODO: Implement use case
    // Example:
    // return repository.getHomeData(
    //   dataSource: DataSource.remote,
    //   cancelToken: cancelToken,
    // );
    throw UnimplementedError('Implement GetHomeDataCase.call()');
  }
}
