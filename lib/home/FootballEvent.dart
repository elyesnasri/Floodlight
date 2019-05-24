class FootballEvent {
  final String homeTeam;
  final String againstTeam;
  final String date;
  final bool isDriver;

  FootballEvent({
    this.homeTeam,
    this.againstTeam,
    this.date,
    this.isDriver
  });
}

class FootballEvent_dummy {

  static Future<List<FootballEvent>> getDummyData() async {
    List<FootballEvent> _data = <FootballEvent>[];

    _data.add(new FootballEvent(
      homeTeam: "Jahn Regensburg",
      againstTeam: "Gegnerteam1",
      date: "24.05.2019",
      isDriver: false
    ));

    _data.add(new FootballEvent(
      homeTeam: "Jahn Regensburg",
      againstTeam: "Gegnerteam2",
      date: "25.05.2019",
      isDriver: true
    ));

    return _data;
  }
}