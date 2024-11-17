import 'package:boookia/features/auth/data/model/request/request..dart';

class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final UserModel prams;
  RegisterEvent(this.prams);
}

class LoginEvent extends AuthEvent {
  final UserModel prams;
  LoginEvent(this.prams);
}

class ForgetPaawordEvent extends AuthEvent {
  final UserModel prams;
  ForgetPaawordEvent(this.prams);
}

class CodeForgetPaawordEvent extends AuthEvent {
  final UserModel prams;
  CodeForgetPaawordEvent(this.prams);
}
