import 'Location.dart';
import 'Team.dart';

class Game {
  final String id;
  final DateTime date;
  final Team homeTeam;
  final Team awayTeam;
  final Location destination;

  Game({
    this.id,
    this.date,
    this.homeTeam,
    this.awayTeam,
    this.destination
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json["id"] as String,
      homeTeam: new Team.fromJson(json["homeTeam"]),
      awayTeam: new Team.fromJson(json["awayTeam"]),
      destination: new Location.fromJson(json["location"])
    );
  }
}