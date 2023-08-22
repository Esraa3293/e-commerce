import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/login/data/repositories/sign_in_data_repo.dart';
import 'package:e_commerce/features/login/domain/repositories/sign_in_domain_repo.dart';
import 'package:e_commerce/features/login/domain/use_cases/sign_in_use_case.dart';
import 'package:e_commerce/features/login/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/data_sources.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInDataSource source;
  SignInCubit(this.source) : super(SignInInItState());

  static SignInCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void signIn() async{
    emit(SignInLoadingState());
    SignInDomainRepo signInDomainRepo = SignInDataRepo(source);
    SignInUseCase signInUseCase = SignInUseCase(signInDomainRepo);
    var result = await signInUseCase.call(emailController.text, passwordController.text);
    result.fold((l) {
      emit(SignInErrorState(l));
    }, (r) {
      emit(SignInSuccessState(r));
    });
  }
}
