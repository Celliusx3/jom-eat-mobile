
import 'package:jomeat/data/sources/jomeat/models/responses/place_response.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/auth_response.dart';

abstract class JomEatDataProvider{
  Future<AuthResponse> signIn(String email, String password);
  Future<List<PlaceResponse>> getPlaces();
}