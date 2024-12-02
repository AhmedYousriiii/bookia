import 'dart:developer';

import 'package:boookia/core/constants/endpoint.dart';
import 'package:boookia/core/services/dio_provider.dart';
import 'package:boookia/core/services/shared_preferences.dart';
import 'package:boookia/features/cart/data/model/request/place_order_prams.dart';
import 'package:boookia/features/cart/data/model/response/cart_model_response/cart_model_response.dart';

class CartRepo {
  static Future<CartModelResponse?> getcart() async {
    try {
      var respones = await DioProvider.get(endpoint: Endpoint.cart, header: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPrefere.getData(
          SharedPrefere.token,
        )}',
      });
      if (respones.statusCode == 200) {
        return CartModelResponse.fromJson(respones.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addTocart({required int productId}) async {
    try {
      var respones =
          await DioProvider.post(endpoint: Endpoint.addtocart, data: {
        "product_id": productId
      }, header: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPrefere.getData(
          SharedPrefere.token,
        )}',
      });
      if (respones.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removeFormcart({required int cartItemId}) async {
    try {
      var respones =
          await DioProvider.post(endpoint: Endpoint.removefromcart, data: {
        "cart_item_id": cartItemId,
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

  static Future<CartModelResponse?> updatecart(
      {required int cartitem, required int quantity}) async {
    try {
      var respones =
          await DioProvider.post(endpoint: Endpoint.updatecart, data: {
        "cart_item_id": cartitem,
        "quantity": quantity
      }, header: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPrefere.getData(
          SharedPrefere.token,
        )}',
      });
      if (respones.statusCode == 201) {
        return CartModelResponse.fromJson(respones.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool?> checkout() async {
    try {
      var respones =
          await DioProvider.get(endpoint: Endpoint.checkout, header: {
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

  static Future<bool> placeOrder({required PlaceOrderPrams prams}) async {
    log("------------------a-------------");
    try {
      var respones = await DioProvider.post(
        endpoint: Endpoint.PlaceOrder,
        data: prams.toJson(),
        header: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SharedPrefere.getData(
            SharedPrefere.token,
          )}',
        },
      );
      if (respones.statusCode == 201) {
        log("------------------done-------------");
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
