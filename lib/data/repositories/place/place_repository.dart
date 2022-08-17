
import 'package:jomeat/data/sources/jomeat/models/responses/place_response.dart';

abstract class PlaceRepository{
  Future<List<PlaceResponse>> getPlaces();
}