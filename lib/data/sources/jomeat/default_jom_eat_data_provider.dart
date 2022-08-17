import 'package:get/get.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/place_response.dart';
import 'package:jomeat/data/services/storage/storage_service.dart';
import 'package:jomeat/data/sources/jomeat/jom_eat_data_provider.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/auth_response.dart';

class DefaultJomEatDataProvider extends GetConnect implements JomEatDataProvider {
  StorageService storageService;

  DefaultJomEatDataProvider({
    required this.storageService
  });

  @override
  void onInit() {
    httpClient.baseUrl = "https://jom-eat.herokuapp.com";
    httpClient.addAuthenticator<dynamic>((request) async {
      final auth = await storageService.getAuth();
      // Set the header
      if (auth != null) {
        request.headers['Authorization'] = "Bearer ${auth.idToken}";
      }
      return request;
    });
  }

  @override
  Future<List<PlaceResponse>> getPlaces() {
    return get("/places")
      .then((value) {
        print(value.statusCode);
        return (value.body as List).map((e) => PlaceResponse.fromJson(e)).toList();
    });
  }

  @override
  Future<AuthResponse> signIn(String email, String password) {
    return post("/auth/signin", {
      "email": email,
      "password": password
    }).then((value) {
      return AuthResponse.fromJson(value.body);
    });
  }
}