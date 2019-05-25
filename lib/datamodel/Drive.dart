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
}