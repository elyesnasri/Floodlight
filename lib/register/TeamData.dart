class Team {
  String id;
  String name;
  String logoURI;
}

final List<Team> teams = <Team>[
  new Team()
    ..id = "st-pauli"
    ..name = "FC St. Pauli"
    ..logoURI = "lib/assets/Stpauli_logo.png",
  new Team()
    ..id = "hsv"
    ..name = "Hamburger SV"
    ..logoURI = "lib/assets/HSV-Logo.png",
  new Team()
    ..id = "fc-koeln"
    ..name = "1. FC Köln"
    ..logoURI = "lib/assets/FC_Koeln_Logo.png",
  new Team()
    ..id = "ssv-jahn"
    ..name = "SSV Jahn Regensburg"
    ..logoURI = "lib/assets/Jahn_Logo.png",
];