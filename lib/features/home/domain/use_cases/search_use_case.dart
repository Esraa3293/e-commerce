import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class SearchUseCase {
  HomeDomainRepo homeDomainRepo;

  SearchUseCase(this.homeDomainRepo);

  Future<Either<Failures, CategoryOrBrandEntity>> call(String categoryId) =>
      homeDomainRepo.search(categoryId);
}
