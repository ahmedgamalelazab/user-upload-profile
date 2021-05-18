part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Register extends AuthEvent {
  //action payload
  final SignUp register;

  Register({@required this.register});
}

class Login extends AuthEvent {
  final SignIn signIn;

  Login({@required this.signIn});
}
