import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class GetCategoriesUseCase {
  HomeDomainRepo homeDomainRepo;

  GetCategoriesUseCase(this.homeDomainRepo);

  Future<Either<Failures, CategoryOrBrandEntity>> call() =>
      homeDomainRepo.getCategories();
}
