import 'dart:developer';

import 'package:boookia/core/constants/endpoint.dart';
import 'package:boookia/core/services/dio_provider.dart';
import 'package:boookia/core/services/shared_preferences.dart';
import 'package:boookia/features/profile/data/model/request/update_password.dart';
import 'package:boookia/features/profile/data/model/request/update_profile_prams.dart';
import 'package:boookia/features/profile/data/model/response/profile_response/profile_response.dart';

class ProfileRepo {
  static Future<ProfileResponse?> getprofile() async {
    try {
      var respones = await DioProvider.get(endpoint: Endpoint.profile, header: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPrefere.getData(
          SharedPrefere.token,
        )}',
      });
      if (respones.statusCode == 200) {
        return ProfileResponse.fromJson(respones.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> logout() async {
    try {
      var respones = await DioProvider.post(endpoint: Endpoint.logout, header: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPrefere.getData(
          SharedPrefere.token,
        )}',
      });
      log("----------------a----------");
      if (respones.statusCode == 200) {
        log("----------------done----------");
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      return false;
    }
  }

  static Future<bool> updateprofile({required UpdateProfilePrams prmas}) async {
    try {
      var respones =
          await DioProvider.post(endpoint: Endpoint.updateprofile, data: {
        "name": prmas.name,
        "address": prmas.address,
        "phone": prmas.phone,
      }, header: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPrefere.getData(
          SharedPrefere.token,
        )}',
      });

      if (respones.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      return false;
    }
  }

  static Future<bool?> updatePassword(
      {required UpdatePasswordprmas prmas}) async {
    try {
      var respones =
          await DioProvider.post(endpoint: Endpoint.updatepassword, data: {
        'current_password': prmas.currentpassword,
        'new_password': prmas.newpassword,
        'new_password_confirmation': prmas.newpasswordconfirmation
      }, header: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPrefere.getData(
          SharedPrefere.token,
        )}',
      });

      if (respones.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      return false;
    }
  }
}
