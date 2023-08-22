import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/login/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/login/data/models/SignInModel.dart';

class SignInRemoteDto implements SignInDataSource {
  Dio dio = Dio();

  @override
  Future<Either<Failures, SignInModel>> signIn(
      String email, String password) async {
    try {
      var response = await dio.post("${Constants.baseUrlApi}${EndPoints.login}",
          data: {"email": email, "password": password});
      SignInModel signInModel = SignInModel.fromJson(response.data);
      return Right(signInModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
