class Location {
  final double longitude;
  final double latitude;

  Location({
    this.longitude,
    this.latitude
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json["latitude"] as double,
      longitude: json["longitude"] as double
    );
  }
}