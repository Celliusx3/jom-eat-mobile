import 'package:get/get.dart';
import 'package:jomeat/data/repositories/auth/auth_repository.dart';
import 'package:jomeat/data/repositories/place/place_repository.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/place_response.dart';

class HomeController extends GetxController {
  final PlaceRepository _placeRepository;

  final _initialLoading = false.obs;
  final _data = <PlaceResponse>[].obs;

  List<PlaceResponse> get data => _data.toList();

  HomeController(this._placeRepository);

  @override
  void onInit() async {
    super.onInit();
    await _onGetHome(true);
  }

  Future<void> _onGetHome(bool isInitialLoading) async {
    return _placeRepository.getPlaces().then((value) {
      _addData(true, value);
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> onRefresh() async {
    return _onGetHome(true);
  }

  void _addData(bool shouldRefresh, List<PlaceResponse> response) {
    final list = shouldRefresh ? <PlaceResponse>[] : data;
    list.addAll(response);
    _data.value = list;
  }
}