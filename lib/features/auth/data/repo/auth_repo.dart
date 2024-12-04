import 'dart:convert';
import 'dart:developer';

import 'package:boookia/core/constants/endpoint.dart';
import 'package:boookia/core/services/dio_provider.dart';
import 'package:boookia/core/services/shared_preferences.dart';
import 'package:boookia/features/auth/data/model/request/newpasswordprams.dart';
import 'package:boookia/features/auth/data/model/request/request..dart';
import 'package:boookia/features/auth/data/model/response/user_model_respone/user_model_respone.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_event.dart';

class AuthRepo {
  static Future<UserModelRespone?> register(UserModel prams) async {
    try {
      var response = await DioProvider.post(
        endpoint: Endpoint.register,
        data: prams.toJson(),
      );

      if (response.statusCode == 201) {
        return UserModelRespone.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<UserModelRespone?> login(UserModel prams) async {
    try {
      var response = await DioProvider.post(
        endpoint: Endpoint.login,
        data: prams.toJson(),
      );
      if (response.statusCode == 200) {
        return UserModelRespone.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<bool> forgetpassword(UserModel prams) async {
    try {
      var response = await DioProvider.post(
        endpoint: Endpoint.forgetpassword,
        data: prams.toJson(),
      );
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return false;
  }

  static Future<bool> Codeforgetpass({required int? code}) async {
    try {
      var response = await DioProvider.post(
        endpoint: Endpoint.checkforgetpassword,
        data: {"verify_code": code},
        header: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SharedPrefere.getData(
            SharedPrefere.token,
          )}',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return false;
  }

  static Future<bool> createNewPaaword({required Newpasswordprams prams}) async {
    try {
      var response = await DioProvider.post(
        endpoint: Endpoint.resetpassword,
        data: {
          "verify_code": prams.verifyCode,
          "new_password": prams.newPassword,
          "new_password_confirmation": prams.newPasswordConfirmation,
        },
        header: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SharedPrefere.getData(
            SharedPrefere.token,
          )}',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return false;
  }
}
