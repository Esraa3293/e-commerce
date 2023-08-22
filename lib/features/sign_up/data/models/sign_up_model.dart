import 'dart:convert';

import 'package:e_commerce/features/sign_up/domain/entities/SignUpEntity.dart';

class SignUpModel extends SignUpEntity {
  String message;

  SignUpModel({required this.message, required String token, required UserModel
  user}) : super(
    token: token,
    user: user
  );

  SignUpModel.fromJson (Map<String,dynamic>json) : this(
    message : json['message'],
    token : json['token'],
    user: UserModel.fromJson(json['user'])
  );
}

class UserModel extends UserEntity {

  String role;

  UserModel({required String name,required String email,required this.role}):super(
    name: name,
    email: email
  );

  UserModel.fromJson(Map<String,dynamic>json) : this(
    name: json['name'],
    email: json['email'],
    role: json['role']
  );
}