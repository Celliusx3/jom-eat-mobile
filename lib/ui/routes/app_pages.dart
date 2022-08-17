import 'package:get/get.dart';
import 'package:jomeat/ui/middleware/auth_middleware.dart';
import 'package:jomeat/ui/presentations/home/binding/home_binding.dart';
import 'package:jomeat/ui/presentations/main/binding/main_binding.dart';
import 'package:jomeat/ui/presentations/main/main_screen.dart';
import 'package:jomeat/ui/presentations/search/binding/search_binding.dart';
import 'package:jomeat/ui/presentations/settings/binding/settings_binding.dart';
import 'package:jomeat/ui/presentations/signin/binding/signin_binding.dart';
import 'package:jomeat/ui/presentations/signin/signin_screen.dart';

class AppPages {
  static const INITIAL = MainScreen.routeName;

  static final routes = [
    GetPage(
      name: SigninScreen.routeName,
      page: () => const SigninScreen(),
      bindings: [
        SigninBinding(),
      ]
    ),
    GetPage(
      middlewares: [
        AuthMiddleware(),
      ],
      name: MainScreen.routeName,
      page: () => const MainScreen(),
      bindings: [
        MainBinding(),
        HomeBinding(),
        SearchBinding(),
        SettingsBinding()
      ]
    ),
  ];
}
