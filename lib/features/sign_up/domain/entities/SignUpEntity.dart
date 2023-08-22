import 'package:equatable/equatable.dart';

/// message : "success"
/// user : {"name":"esraahassan","email":"esraahassan@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YTZmZGEyZWE1YTFhMDAzMzQzNjJlNSIsIm5hbWUiOiJlc3JhYWhhc3NhbiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg4NjY1NTExLCJleHAiOjE2OTY0NDE1MTF9.w6xCnK3nZnbg1KY2kRAio56v3HpGxZFtOQSx1JUUsPA"

class SignUpEntity extends Equatable{
  SignUpEntity({
    this.user,
    this.token,
  });

  UserEntity? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [user, token];
}

/// name : "esraahassan"
/// email : "esraahassan@gmail.com"
/// role : "user"

class UserEntity extends Equatable{
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  @override
  // TODO: implement props
  List<Object?> get props => [name, email];
}
