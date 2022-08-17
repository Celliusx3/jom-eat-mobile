class AuthResponse {
  String idToken;
  String refreshToken;
  int expiresIn;
  String localId;

  AuthResponse({
    required this.idToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
  });

  AuthResponse.fromJson(Map json)
      : idToken = json['idToken'],
        refreshToken = json['refreshToken'],
        expiresIn = int.parse(json['expiresIn']),
        localId = json['localId'];

  Map<String, dynamic> toMap() {
    return {
      'idToken': idToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn.toString(),
      'localId': localId
    };
  }
}