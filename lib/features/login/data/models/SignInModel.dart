import 'dart:convert';

import '../../../sign_up/domain/entities/SignUpEntity.dart';
import '../../domain/entities/SignInEntity.dart';

class SignInModel extends SignInEntity {
  String message;

  SignInModel(
      {required this.message, required String token, required UserModel user})
      : super(token: token, user: user);

  SignInModel.fromJson(Map<String, dynamic> json)
      : this(
            message: json['message'],
            token: json['token'],
            user: UserModel.fromJson(json['user']));
}

class UserModel extends UserEntity {
  String role;

  UserModel({required String name, required String email, required this.role})
      : super(name: name, email: email);

  UserModel.fromJson(Map<String, dynamic> json)
      : this(name: json['name'], email: json['email'], role: json['role']);
}
