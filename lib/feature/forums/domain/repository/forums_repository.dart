import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/forum_entity.dart';

abstract class ForumsRepository {
  Future<Either<Failure, List<ForumEntity>>> getForumsListing({
    required int pageNumber,
    required int showUsers,
    required String orderBy,
    required String search,
    required String specialities,
  });
}
