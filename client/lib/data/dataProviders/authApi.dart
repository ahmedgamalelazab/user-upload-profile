import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:upload_users_images/config/backend.dart';
import '../Models/authModel.dart';

abstract class AuthApi {
  Future<AuthGlobalSignInAndSinUpResponseModel> signUp(
      {@required SignUp signUp});

  Future<AuthGlobalSignInAndSinUpResponseModel> signIn(
      {@required SignIn signIn});
}

class AuthDataProvider extends AuthApi {
  @override
  Future<AuthGlobalSignInAndSinUpResponseModel> signIn({SignIn signIn}) async {
    try {
      final response = await http.post(
        BackEndConnectionConfig.getSigninUri(),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(signIn.toJson()),
      );
      if (response.statusCode == 201) {
        final responseParser =
            json.decode(response.body) as Map<String, dynamic>;
        return AuthGlobalSignInAndSinUpResponseModel.fromJson(responseParser);
      } else {
        final responseParser =
            json.decode(response.body) as Map<String, dynamic>;
        return AuthGlobalSignInAndSinUpResponseModel.fromJson(responseParser);
      }
    } catch (error) {
      print(error);
    }

    //!failure
    return AuthGlobalSignInAndSinUpResponseModel(
        error: true,
        errorMessage: "dataProviderSectionError",
        success: false,
        userName: null,
        userEmail: null,
        token: null);
  }

  @override
  Future<AuthGlobalSignInAndSinUpResponseModel> signUp({SignUp signUp}) async {
    try {
      final response = await http.post(
        BackEndConnectionConfig.getRegisterUri(),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(signUp.toJson()),
      );
      if (response.statusCode == 201) {
        final responseParser =
            json.decode(response.body) as Map<String, dynamic>;
        return AuthGlobalSignInAndSinUpResponseModel.fromJson(responseParser);
      } else {
        final responseParser =
            json.decode(response.body) as Map<String, dynamic>;
        return AuthGlobalSignInAndSinUpResponseModel.fromJson(responseParser);
      }
    } catch (error) {
      print(error);
    }

    //!failure
    return AuthGlobalSignInAndSinUpResponseModel(
        error: true,
        errorMessage: "dataProviderSectionError",
        success: false,
        userName: null,
        userEmail: null,
        token: null);
  }
}
