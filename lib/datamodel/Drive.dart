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
    return Drive(
      driveId: json["id"] as String,
      freeSeats: json["seats"] as int,
      driver: new User.fromJson(json["driverMapping"]),
      passengers: (json["passengerMappings"] as List).map((entry) => User.fromJson(entry)).toList(),
      game: new Game.fromJson(json["game"]),
    );
  }
}