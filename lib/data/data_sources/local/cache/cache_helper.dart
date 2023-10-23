import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> ensureInitialized() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return _sharedPreferences?.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _sharedPreferences!.setString(key, value);
    if (value is double) return await _sharedPreferences!.setDouble(key, value);
    if (value is bool) return await _sharedPreferences!.setBool(key, value);
    if (value is List<String>) return await _sharedPreferences!.setStringList(key, value);
    await ensureInitialized();
    return await _sharedPreferences!.setInt(key, value);
  }

  static void removeData({required String key}) async {
    await ensureInitialized();
    await _sharedPreferences!.remove(key);
  }

  static void removeAllData() async {
    await ensureInitialized();
    await _sharedPreferences!.clear();
  }
}
