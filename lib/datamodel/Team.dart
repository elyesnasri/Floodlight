import 'package:floodlight/datamodel/Location.dart';

class Team {
  final String id;
  final String name;
  final Location location;

  Team({
    this.id,
    this.name,
    this.location,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"] as String,
      name: json["name"]as String,
      location: Location.fromJson(json["location"]),
    );
  }
}