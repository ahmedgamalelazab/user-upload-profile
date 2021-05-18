import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:upload_users_images/data/Models/authModel.dart';
import 'package:upload_users_images/data/repository/authRepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({@required this.authRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is Register) {
      yield LoadingAuth();
      await Future.delayed(
        Duration(seconds: 3),
      );
      try {
        final signUpResponseRaw =
            await authRepository.signUpResponse(event.register);
        if (signUpResponseRaw.error) {
          yield LoadedGlobalStateForSigninORSignUpEndedWithError(
              loadedSignup: signUpResponseRaw);
          await Future.delayed(
            Duration(seconds: 3),
          );
          yield RedirectingFromErrorScreenToLoginScreen();
        } else {
          yield LoadedSignupAuth(signUpResponseRaw);
        }
      } catch (error) {
        print(error);
      }
    } else if (event is Login) {
      yield LoadingAuth();
      await Future.delayed(
        Duration(seconds: 3),
      );
      try {
        final signInResponse =
            await authRepository.signInRepository(event.signIn);
        if (signInResponse.error) {
          yield LoadedGlobalStateForSigninORSignUpEndedWithError(
              loadedSignup: signInResponse);
          await Future.delayed(
            Duration(seconds: 3),
          );
          yield RedirectingFromErrorScreenToLoginScreen();
        } else {
          yield LoadedSigninAuth(signInResponse);
        }
        yield LoadedSigninAuth(signInResponse);
      } catch (error) {
        print(error);
      }
    }
  }
}
