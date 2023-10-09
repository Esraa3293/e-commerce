import 'package:e_commerce/features/home/domain/entities/LoggedUserDataEntity.dart';

/// message : "success"
/// user : {"name":"abdelrahman","email":"abdelrahmanmaher@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZDkxNjVlOWE2OTU0MDAzNGRmMThkOSIsIm5hbWUiOiJhYmRlbHJhaG1hbiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk1MjI1ODg0LCJleHAiOjE3MDMwMDE4ODR9.Iw_qlVwojCdAv_yLPv3sONCptzXHzwAKF1JIC2C66hQ"

class LoggedUserDataModel extends LoggedUserDataEntity{
  LoggedUserDataModel({
      super.message,
      super.user,
      super.token,});

  LoggedUserDataModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (user != null) {
  //     map['user'] = user?.toJson();
  //   }
  //   map['token'] = token;
  //   return map;
  // }

}

/// name : "abdelrahman"
/// email : "abdelrahmanmaher@gmail.com"
/// role : "user"

class User extends LoggedUser{
  User({
      super.name,
      super.email,
      super.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['name'] = name;
  //   map['email'] = email;
  //   map['role'] = role;
  //   return map;
  // }

}