import 'dart:developer';

import 'package:boookia/core/constants/endpoint.dart';
import 'package:boookia/core/services/dio_provider.dart';
import 'package:boookia/features/home/data/model/response/product_new_arrivals/product_new_arrivals.dart';
import 'package:boookia/features/home/data/model/response/slider_model/slider_model.dart';

class HomeRepo {
  static Future<ProductNewArrivalsResponse?> getNewArrivalBook() async {
    try {
      var respones = await DioProvider.get(
        endpoint: Endpoint.productsnewarrivals,
      );
      if (respones.statusCode == 200) {
        return ProductNewArrivalsResponse.fromJson(respones.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<SliderModelResponse?> getSliders() async {
    try {
      var respones = await DioProvider.get(
        endpoint: Endpoint.sliders,
      );
      if (respones.statusCode == 200) {
        return SliderModelResponse.fromJson(respones.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
