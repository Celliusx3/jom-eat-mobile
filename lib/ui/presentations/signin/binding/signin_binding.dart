import 'package:get/get.dart';

import '../controller/signin_controller.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() {
      return SigninController(Get.find());
    });
  }
}