class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates
  });

  Location.fromJson(Map json)
      : type = json['type'],
        coordinates = List<double>.from(json['coordinates']);
}