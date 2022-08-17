import 'package:get/get.dart';
import 'package:jomeat/data/repositories/auth/auth_repository.dart';
import 'package:jomeat/data/repositories/place/place_repository.dart';
import 'package:jomeat/ui/presentations/home/controller/home_controller.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(Get.find<PlaceRepository>());
    });
  }
}