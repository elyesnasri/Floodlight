import 'Location.dart';

class User {
  String username;
  String name;
  Location location;

  User({
    this.username,
    this.name,
    this.location
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: extractUsername(json),
      name: extractName(json),
      location: Location.fromJson(json["location"]),
    );
  }

  static String extractUsername(Map<String, dynamic> json) {
    Map<String, dynamic> map = json["user"];
    return map["username"];
  }

  static String extractName(Map<String, dynamic> json) {
    Map<String, dynamic> map = json["user"];
    return map["name"];
  }

}