import 'Location.dart';
import 'Team.dart';

class Game {
  final String id;
  final DateTime date;
  final Team homeTeam;
  final Team againstTeam;
  final Location destination;

  Game({
    this.id,
    this.date,
    this.homeTeam,
    this.againstTeam,
    this.destination
  });
}