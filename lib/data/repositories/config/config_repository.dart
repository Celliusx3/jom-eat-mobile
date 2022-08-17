
import 'package:jomeat/data/sources/jomeat/models/responses/auth_response.dart';

abstract class ConfigRepository{
  Future<void> setAuth(AuthResponse? auth);

  AuthResponse? get user;
}
