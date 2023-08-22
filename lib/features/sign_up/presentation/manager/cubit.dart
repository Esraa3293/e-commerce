import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/sign_up/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/sign_up/data/repositories/sign_up_data_repo.dart';
import 'package:e_commerce/features/sign_up/domain/entities/sign_up_data.dart';
import 'package:e_commerce/features/sign_up/domain/repositories/sign_up_domain_repo.dart';
import 'package:e_commerce/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:e_commerce/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpDataSource source;

  SignUpCubit(this.source) : super(SignUpInitState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void signUp() async {
    emit(SignUpLoadingState());
    SignUpData data = SignUpData(nameController.text, phoneController.text,
        emailController.text, passwordController.text);
    SignUpDomainRepo signUpDomainRepo = SignUpDataRepo(source);
    SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepo);
    var result = await signUpUseCase.call(data);

    result.fold((l) {
      emit(SignUpErrorState(l));
    }, (r) {
      emit(SignUpSuccessState(r));
    });
  }
}
