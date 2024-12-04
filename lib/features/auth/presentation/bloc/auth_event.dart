
import 'package:boookia/features/auth/data/model/request/newpasswordprams.dart';
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
  final int code;

  CodeForgetPaawordEvent({required this.code});
}

class CreateNewPaawordEvent extends AuthEvent {
  final Newpasswordprams prams;

  CreateNewPaawordEvent({required this.prams});
}
