import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/forum_entity.dart';
import '../repository/forums_repository.dart';

class GetForumsListingUseCase {
  final ForumsRepository repository;

  GetForumsListingUseCase({required this.repository});

  Future<Either<Failure, List<ForumEntity>>> call({
    required int pageNumber,
    required int showUsers,
    required String orderBy,
    required String search,
    required String specialities,
  }) {
    return repository.getForumsListing(
      pageNumber: pageNumber,
      showUsers: showUsers,
      orderBy: orderBy,
      search: search,
      specialities: specialities,
    );
  }
}
