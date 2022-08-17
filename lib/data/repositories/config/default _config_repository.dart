
import 'package:get/get.dart';
import 'package:jomeat/data/repositories/config/config_repository.dart';
import 'package:jomeat/data/services/storage/storage_service.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/auth_response.dart';

class DefaultConfigRepository extends GetxService implements ConfigRepository {
  final _user = Rxn<AuthResponse>();

  @override
  AuthResponse? get user => _user.value;

  StorageService storageService;

  DefaultConfigRepository({
    required this.storageService
  });

  @override
  void onInit() async {
    super.onInit();
    await refreshUser();
  }

  Future<AuthResponse?> _getUser() async {
    return storageService.getAuth();
  }

  Future<void> refreshUser() async {
    final auth = await _getUser();
    _user.value = auth;
  }

  @override
  Future<void> setAuth(AuthResponse? auth) async {
    if (auth != null) {
      await storageService.setAuth(auth);
    }
    await refreshUser();
  }
}