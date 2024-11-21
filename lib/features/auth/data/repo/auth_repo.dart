import 'dart:convert';
import 'dart:developer';

import 'package:boookia/core/constants/endpoint.dart';
import 'package:boookia/core/services/dio_provider.dart';
import 'package:boookia/features/auth/data/model/request/request..dart';
import 'package:boookia/features/auth/data/model/response/user_model_respone/user_model_respone.dart';
import 'package:dio/dio.dart';

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

  static Future<bool> Codeforgetpass(UserModel prams) async {
    try {
      var response = await DioProvider.post(
        endpoint: Endpoint.checkforgetpassword,
        data: prams.toJson(),
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
