import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/domain/entities/SignInEntity.dart';

abstract class SignInStates {}

class SignInInItState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  SignInEntity signInEntity;

  SignInSuccessState(this.signInEntity);
}

class SignInErrorState extends SignInStates {
  Failures failures;

  SignInErrorState(this.failures);
}
