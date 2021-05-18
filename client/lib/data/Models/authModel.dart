//coding auth model and the model should have the ability to signup the user and sign in the user

import 'package:flutter/foundation.dart';

class Auth {}

class SignUp extends Auth {
  String userName;
  String userEmail;
  String userPassword;

//!form only job
  SignUp(
      {@required this.userName,
      @required this.userEmail,
      @required this.userPassword});

  SignUp.fromJson(Map<String, dynamic> json) {
    this.userName = json['userName'];
    this.userEmail = json['userEmail'];
    this.userPassword = json['userPassword'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['userName'] = this.userName;
    map['userEmail'] = this.userEmail;
    map['userPassword'] = this.userPassword;
    return map;
  }
}

//!form only job
class SignIn extends Auth {
  String userEmail;
  String userPassword;

  SignIn({@required this.userEmail, @required this.userPassword});

  SignIn.fromJson(Map<String, dynamic> json) {
    this.userEmail = json['userEmail'];
    this.userPassword = json['userPassword'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['userEmail'] = this.userEmail;
    map['userPassword'] = this.userPassword;
    return map;
  }
}

class AuthGlobalSignInAndSinUpResponseModel extends Auth {
  bool error;
  String errorMessage;
  bool success;
  String userName;
  String userEmail;
  String token;

  AuthGlobalSignInAndSinUpResponseModel(
      {@required this.error,
      @required this.errorMessage,
      @required this.success,
      @required this.userName,
      @required this.userEmail,
      @required this.token});

  AuthGlobalSignInAndSinUpResponseModel.fromJson(Map<String, dynamic> json) {
    this.error = json['error'];
    this.errorMessage = json['errorMessage'];
    this.success = json['success'] ?? false;
    this.userName = json['userName'] ?? "null";
    this.userEmail = json['userEmail'] ?? "null";
    this.token = json['token'] ?? "null";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['error'] = this.error;
    map['errorMessage'] = this.errorMessage;
    map['success'] = this.success;
    map['userName'] = this.userName;
    map['userEmail'] = this.userEmail;
    map['token'] = this.token;
    return map;
  }
}
