import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/forum_model.dart';

abstract class ForumsRemoteDataSource {
  Future<Either<Failure, List<ForumModel>>> getForumsListing({
    required int pageNumber,
    required int showUsers,
    required String orderBy,
    required String search,
    required String specialities,
  });
}
