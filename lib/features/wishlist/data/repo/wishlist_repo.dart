import 'dart:developer';

import 'package:boookia/core/constants/endpoint.dart';
import 'package:boookia/core/services/dio_provider.dart';
import 'package:boookia/core/services/shared_preferences.dart';
import 'package:boookia/features/wishlist/data/model/wishlistresponse/wishlistresponse.dart';

class WishListRepo {
  static Future<Wishlistresponse?> getwishlist() async {
    try {
      var respones = await DioProvider.get(endpoint: Endpoint.wishlist, header: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPrefere.getData(
          SharedPrefere.token,
        )}',
      });
      if (respones.statusCode == 200) {
        return Wishlistresponse.fromJson(respones.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addToWishlist({required int productId}) async {
    try {
      var respones = await DioProvider.post(endpoint: Endpoint.addtowishlist, data: {
        "product_id": productId
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
      log(e.toString());
      return false;
    }
  }
  static Future<bool> removeFormToWishlist({required int productId}) async {
    try {
      var respones = await DioProvider.post(endpoint: Endpoint.removefromwishlist, data: {
        "product_id": productId
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
      log(e.toString());
      return false;
    }
  }
}
