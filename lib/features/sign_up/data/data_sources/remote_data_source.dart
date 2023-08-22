import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/sign_up/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/sign_up/data/models/sign_up_model.dart';
import 'package:e_commerce/features/sign_up/domain/entities/sign_up_data.dart';

class RemoteDataSource implements SignUpDataSource {
  Dio dio = Dio();

  @override
  Future<Either<Failures, SignUpModel>> signUp(SignUpData signUpData) async {
    try {
      var response =
          await dio.post("${Constants.baseUrlApi}${EndPoints.signUp}",
            data: {
              "name": signUpData.name,
              "email": signUpData.email,
              "password": signUpData.password,
              "rePassword": signUpData.password,
              "phone": signUpData.phone
            }
          );
      SignUpModel signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
