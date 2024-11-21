import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefere {
  static late String token = "token";
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static cacheData(String key, dynamic valuee) {
    if (valuee is String) {
      sharedPreferences.setString(key, valuee);
    } else if (valuee is bool) {
      sharedPreferences.setBool(key, valuee);
    } else if (valuee is int) {
      sharedPreferences.setInt(key, valuee);
    } else if (valuee is List<String>) {
      sharedPreferences.setStringList(key, valuee);
    }
  }

  static getData(String key) {
    return sharedPreferences.get(key);
  }
}
