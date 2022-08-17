import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jomeat/data/repositories/auth/auth_repository.dart';
import 'package:jomeat/data/repositories/auth/default_auth_repository.dart';
import 'package:jomeat/data/repositories/config/config_repository.dart';
import 'package:jomeat/data/repositories/config/default%20_config_repository.dart';
import 'package:jomeat/data/repositories/place/default_place_repository.dart';
import 'package:jomeat/data/repositories/place/place_repository.dart';
import 'package:jomeat/data/sources/jomeat/default_jom_eat_data_provider.dart';
import 'package:jomeat/data/sources/jomeat/jom_eat_data_provider.dart';

import 'data/services/storage/default_storage_service.dart';
import 'data/services/storage/storage_service.dart';
import 'ui/routes/app_pages.dart';
import 'ui/themes/theme.dart';

Future<void> initServices() async {
  await Get.putAsync<StorageService>(() async => DefaultStorageService());
  await Get.putAsync<JomEatDataProvider>(() async => DefaultJomEatDataProvider(storageService: Get.find()));
  await Get.putAsync<ConfigRepository>(() async => DefaultConfigRepository(storageService: Get.find()));
  await Get.putAsync<PlaceRepository>(() async => DefaultPlaceRepository(dataProvider: Get.find()));
  await Get.putAsync<AuthRepository>(() async => DefaultAuthRepository(dataProvider: Get.find(), configRepository: Get.find()));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // theme: appTheme.themeData,
    );
  }
}