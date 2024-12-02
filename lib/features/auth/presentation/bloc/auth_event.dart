// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boookia/features/auth/data/model/request/request..dart';
import 'package:boookia/features/cart/data/model/request/place_order_prams.dart';

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
