import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repositories/config/config_repository.dart';
import '../presentations/signin/signin_screen.dart';


class AuthMiddleware extends GetMiddleware {
  final configRepository = Get.find<ConfigRepository>();

  // @override
  // Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
  //   print("Redirect Delegate");
  //   final user = await configRepository.getUser();
  //
  //   if (user == null) {
  //     return GetNavConfig.fromRoute(SigninScreen.routeName);
  //   }
  //
  //   return await super.redirectDelegate(route);
  // }

  @override
  RouteSettings? redirect(String? route) {
    print("Redirecting");
    return configRepository.user != null ? null : const RouteSettings(name: SigninScreen.routeName);

  }
}