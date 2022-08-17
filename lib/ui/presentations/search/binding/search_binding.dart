import 'package:get/get.dart';

import '../controller/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() {
      return SearchController();
    });
  }
}