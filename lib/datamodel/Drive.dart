import 'Game.dart';
import 'User.dart';

class Drive {
  final String driveId;
  final int freeSeats;
  final User driver;
  final List<User> passengers;
  final Game game;

  Drive({
    this.driveId,
    this.freeSeats,
    this.driver,
    this.passengers,
    this.game
  });

  factory Drive.fromJson(Map<String, dynamic> json) {
    print(json["passengerMappings"]);
    return Drive(
      driveId: json["id"] as String,
      freeSeats: json["seats"] as int,
      driver: new User.fromJson(json["driverMapping"]),
      passengers: (parseUser(json)).map((entry) => User.fromJson(entry)).toList(),
      game: new Game.fromJson(json["game"]),
    );
  }

  static List parseUser(Map<String, dynamic> map) {
    if (map["passengerMappings"] == null) {
      return List();
    } else {
      return map["passengerMappings"] as List;
    }
  }
}