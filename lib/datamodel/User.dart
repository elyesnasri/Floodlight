import 'Location.dart';

class User {
  final String username;
  final String name;
  final Location location;

  User({
    this.username,
    this.name,
    this.location
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"] as String,
      name: json["name"] as String,
      location: new Location.fromJson(json["location"]),
    );
  }

}