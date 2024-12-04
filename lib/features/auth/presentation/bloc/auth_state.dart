class AuthState {}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class ForgetPaawordloadingState extends AuthState {}

class ForgetPaawordSuccessState extends AuthState {}

class CodepasswordloadingState extends AuthState {}

class CodepasswordSuccessState extends AuthState {}

class CreatepasswordloadingState extends AuthState {}

class CreatepasswordSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  String meassage;
  AuthErrorState({required this.meassage});
}
