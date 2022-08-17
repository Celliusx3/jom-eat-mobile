
import 'package:jomeat/data/sources/jomeat/models/entities/location.dart';

class PlaceResponse {
  String id;
  String userId;
  String name;
  String description;
  Location location;
  List<String> uploads;

  PlaceResponse({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.location,
    required this.uploads
  });

  PlaceResponse.fromJson(Map json)
      : id = json['id'],
        userId = json['userId'],
        name = json['name'],
        description = json['description'],
        location = Location.fromJson(json['location']),
        uploads = List<String>.from(json['uploads']);
}