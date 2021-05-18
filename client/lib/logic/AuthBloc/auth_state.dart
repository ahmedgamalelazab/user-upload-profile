part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingAuth extends AuthState {}

class LoadedSignupAuth extends AuthState {
  final AuthGlobalSignInAndSinUpResponseModel loadedSignup;

  LoadedSignupAuth(this.loadedSignup);
}

class LoadedSigninAuth extends AuthState {
  final AuthGlobalSignInAndSinUpResponseModel loadedSignIn;

  LoadedSigninAuth(this.loadedSignIn);
}

//section of dark senarios
class LoadedGlobalStateForSigninORSignUpEndedWithError extends AuthState {
  final AuthGlobalSignInAndSinUpResponseModel loadedSignup;
  LoadedGlobalStateForSigninORSignUpEndedWithError(
      {@required this.loadedSignup});
}

class RedirectingFromErrorScreenToLoginScreen extends AuthState {}
