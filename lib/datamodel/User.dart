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
      username: json["username"] as String,
      name: json["name"] as String,
      location: Location.fromJson(json["location"]),
    );
  }

}