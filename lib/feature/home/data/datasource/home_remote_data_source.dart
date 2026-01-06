import '../../../../global_imports.dart';

abstract class HomeRemoteDataSource {
  // TODO: Add remote data source methods
  // Example:
  // Future<ApiResponse<HomeModel>> getHomeData({
  //   required CancelToken cancelToken,
  // });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  // TODO: Implement remote data source methods
}
