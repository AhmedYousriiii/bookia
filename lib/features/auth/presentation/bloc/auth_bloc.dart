import 'dart:developer';

import 'package:boookia/core/services/shared_preferences.dart';
import 'package:boookia/features/auth/data/repo/auth_repo.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
    on<ForgetPaawordEvent>(forgetpasswoed);
    on<CodeForgetPaawordEvent>(Codeforgetpassword);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      await AuthRepo.register(event.prams).then(
        (value) {
          if (value != null) {
            SharedPrefere.cacheData(SharedPrefere.token, value.data?.token);
            emit(RegisterSuccessState());
            // log("_________________________________Ahmed____________");
          } else {
            emit(AuthErrorState(
                meassage: 'Unexpected Error occur, please tryy again'));
          }
        },
      );
    } on Exception {
      emit(
          AuthErrorState(meassage: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      await AuthRepo.login(event.prams).then(
        (value) {
          if (value != null) {
            SharedPrefere.cacheData(SharedPrefere.token, value.data?.token);
            emit(LoginSuccessState());
            // log("_________________________________Ahmed____________");
          } else {
            emit(AuthErrorState(
                meassage: 'Unexpected Error occur, please tryy again'));
          }
        },
      );
    } on Exception {
      emit(
          AuthErrorState(meassage: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> forgetpasswoed(
      ForgetPaawordEvent event, Emitter<AuthState> emit) async {
    emit(ForgetPaawordloadingState());
    try {
      await AuthRepo.forgetpassword(event.prams).then(
        (value) {
          if (value != null) {
            emit(ForgetPaawordSuccessState());
          } else {
            emit(AuthErrorState(
                meassage: 'Unexpected Error occur, please tryy again'));
          }
        },
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> Codeforgetpassword(
      CodeForgetPaawordEvent event, Emitter<AuthState> emit) async {
    emit(CodepasswordloadingState());
    try {
      await AuthRepo.Codeforgetpass(event.prams).then(
        (value) {
          if (value != null) {
            emit(CodepasswordSuccessState());
          } else {
            emit(AuthErrorState(
                meassage: 'Unexpected Error occur, please tryy again'));
          }
        },
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
