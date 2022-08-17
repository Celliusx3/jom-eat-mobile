import 'dart:convert';

import 'package:get/get.dart';
import 'package:jomeat/data/services/storage/storage_service.dart';
import 'package:jomeat/data/services/storage/storage_service_constants.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultStorageService extends GetxService implements StorageService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<Set<String>> getAllKeys() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getKeys();
  }

  @override
  Future<bool> getBoolean(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key) ?? false;
  }

  @override
  Future<int> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key) ?? 0;
  }

  @override
  Future<String> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? "";
  }

  @override
  Future<void> removeString(String key) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }

  @override
  Future<void> setBoolean(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value);
  }

  @override
  Future<void> setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(key, value);
  }

  @override
  Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  @override
  Future<AuthResponse?> getAuth() async {
    final data = await getString(StorageServiceConstants.AUTH);
    if (data.isEmpty) {
      return null;
    } else {
      return AuthResponse.fromJson(jsonDecode(data));
    }
  }

  @override
  Future<void> setAuth(AuthResponse auth) async {
    await setString(StorageServiceConstants.AUTH, jsonEncode(auth.toMap()));
  }
}