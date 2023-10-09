/// message : "success"
/// user : {"name":"abdelrahman","email":"abdelrahmanmaher@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZDkxNjVlOWE2OTU0MDAzNGRmMThkOSIsIm5hbWUiOiJhYmRlbHJhaG1hbiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk1MjI1ODg0LCJleHAiOjE3MDMwMDE4ODR9.Iw_qlVwojCdAv_yLPv3sONCptzXHzwAKF1JIC2C66hQ"

class LoggedUserDataEntity {
  LoggedUserDataEntity({
      this.message, 
      this.user, 
      this.token,});

  LoggedUserDataEntity.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? LoggedUser.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  LoggedUser? user;
  String? token;

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

class LoggedUser {
  LoggedUser({
      this.name, 
      this.email, 
      this.role,});

  LoggedUser.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['name'] = name;
  //   map['email'] = email;
  //   map['role'] = role;
  //   return map;
  // }

}