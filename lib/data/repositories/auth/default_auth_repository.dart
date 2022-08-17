
import 'package:get/get.dart';
import 'package:jomeat/data/repositories/auth/auth_repository.dart';
import 'package:jomeat/data/repositories/config/config_repository.dart';
import 'package:jomeat/data/sources/jomeat/jom_eat_data_provider.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/auth_response.dart';

class DefaultAuthRepository extends GetxService implements AuthRepository {
  JomEatDataProvider dataProvider;
  ConfigRepository configRepository;

  DefaultAuthRepository({
    required this.dataProvider,
    required this.configRepository
  });

  @override
  Future<AuthResponse> signIn (String email, String password) async {
    final data = await dataProvider.signIn(email, password);
    await configRepository.setAuth(data);
    return data;
  }
}