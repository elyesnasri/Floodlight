class Team {
  final String id;
  final String name;

  Team({
    this.id,
    this.name
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"] as String,
      name: json["name"]as String
    );
  }
}