
import 'package:get/get.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/place_response.dart';
import 'package:jomeat/data/repositories/place/place_repository.dart';
import 'package:jomeat/data/sources/jomeat/jom_eat_data_provider.dart';

class DefaultPlaceRepository extends GetxService implements PlaceRepository {
  JomEatDataProvider dataProvider;

  DefaultPlaceRepository({
    required this.dataProvider
  });

  @override
  Future<List<PlaceResponse>> getPlaces() {
    return dataProvider.getPlaces();
  }
}