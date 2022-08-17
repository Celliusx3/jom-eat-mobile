import 'package:jomeat/data/sources/jomeat/models/responses/auth_response.dart';

abstract class AuthRepository{
  Future<AuthResponse> signIn(String email, String password);
}