import 'package:jomeat/data/sources/jomeat/models/responses/auth_response.dart';

abstract class StorageService {
  Future<String> getString(String key);
  Future<void> setString(String key, String value);
  Future<void> removeString(String key);
  Future<Set<String>> getAllKeys();
  Future<bool> getBoolean(String key);
  Future<void> setBoolean(String key, bool value);
  Future<int> getInt(String key);
  Future<void> setInt(String key, int value);

  Future<void> setAuth(AuthResponse auth);
  Future<AuthResponse?> getAuth();
}
