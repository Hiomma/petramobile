import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static void setStorage<T>(String key, T value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, json.encode(value));
  }

  static Future<T> getStorage<T>(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return json.decode(sharedPreferences.getString(key)) as T;
  }
}
