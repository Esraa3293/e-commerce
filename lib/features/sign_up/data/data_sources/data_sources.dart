import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/sign_up/data/models/sign_up_model.dart';
import 'package:e_commerce/features/sign_up/domain/entities/sign_up_data.dart';

abstract class SignUpDataSource {
  Future<Either<Failures,SignUpModel>> signUp(SignUpData signUpData);
}