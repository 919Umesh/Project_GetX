import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {

  static Future<bool> save(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

  static Future<bool> saveBool({String? key, bool? value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(key!, value!);
  }

  static Future<bool> saveStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setStringList(key, value);
  }

  static Future<List<String>?> getStringList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(key);
  }

  static Future<String> getByUrl(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(url) ?? '';
  }

  static Future<String> getString({@required String? key}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key!) ?? '';
    } catch (e) {
      return '';
    }
  }

  static Future<int> getInt({@required String? key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key!) ?? 0;
  }

  static Future<bool> saveInt({required String key, required int value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(key, value);
  }

  static Future<bool> getBool({@required String? key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolVlaue = false;
    try {
      boolVlaue = prefs.getBool(key!) ?? false;
    } catch (e) {
      boolVlaue = false;
    }
    return boolVlaue;
  }

  static Future<bool> saveLastSavedTime(String key, int value) async {
    final String newKey = "${key}_last_saved_time";
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(newKey, value);
  }

  static Future<int?> getLastSavedTime(String key) async {
    final String newKey = "${key}_last_saved_time";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(newKey);
  }

  static Future<bool> clear(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, "");
  }

  static Future<bool> clearAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> saveSubscribedTopic(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, "");
  }

  static Future<bool> setMapList(
    String key,
    List<Map<String, dynamic>> value,
  ) async {
    final List<String> messagesString = [];
    for (final item in value) {
      messagesString.add(json.encode(item));
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, messagesString);
  }

  static Future<List<dynamic>> getMapList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> messagesString = [];
    try {
      messagesString = prefs.getStringList(key) ?? [];
    } catch (e) {
      messagesString = [];
    }
    final List<dynamic> value = [];
    if (messagesString.isNotEmpty) {
      for (final element in messagesString) {
        value.add(json.decode(element));
      }
    }

    return value;
  }
}
