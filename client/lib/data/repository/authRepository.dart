import 'package:flutter/foundation.dart';
import 'package:upload_users_images/data/Models/authModel.dart';
import 'package:upload_users_images/data/dataProviders/authApi.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({@required this.authApi});

  Future<AuthGlobalSignInAndSinUpResponseModel> signUpResponse(
      SignUp signUp) async {
    try {
      return await authApi.signUp(signUp: signUp);
    } catch (error) {
      return AuthGlobalSignInAndSinUpResponseModel(
          error: true,
          errorMessage: "repositoryFailure",
          success: false,
          userName: null,
          userEmail: null,
          token: null);
    }
  }

  Future<AuthGlobalSignInAndSinUpResponseModel> signInRepository(
      SignIn signIn) async {
    try {
      return await authApi.signIn(signIn: signIn);
    } catch (error) {
      return AuthGlobalSignInAndSinUpResponseModel(
          error: true,
          errorMessage: "repositoryFailure",
          success: false,
          userName: null,
          userEmail: null,
          token: null);
    }
  }
}
