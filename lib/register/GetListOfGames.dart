import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:floodlight/data/DriveData.dart';
import 'package:floodlight/datamodel/Game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'TeamData.dart';

typedef IndexCallback = void Function(Game game);

class GetListOfGames extends StatefulWidget {
  final IndexCallback onSelectedCallback;

  const GetListOfGames({Key key, this.onSelectedCallback}): super(key: key);

  @override
  _GetListOfGamesState createState() => _GetListOfGamesState();
}

class _GetListOfGamesState extends State<GetListOfGames> {
  int selectedIndex = 0;
  List<Game> games;


  _onSelected(int index) {
    setState(() => selectedIndex = index);
    print(selectedIndex);
    widget.onSelectedCallback(games[index]);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Game>>(
      future: fetchGames(http.Client()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            games = snapshot.data;
            return buildListView(games);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("${snapshot.error}");
          }

          return Center(child: CircularProgressIndicator());
        }
    );
  }

  ListView buildListView(List<Game> games) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: games.length,
      itemBuilder: (context, index) => Container(
        child: Card(
          color: selectedIndex != null && selectedIndex == index
              ? Colors.red
              : Colors.white,
          child: InkWell(
            splashColor: Colors.red.withAlpha(30),
            onTap: () => _onSelected(index),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        new Image.asset(
                          iconMapping[games[index].homeTeam.id],
                          width: 75.0,
                          height: 75.0,
                        ),
                        Text(
                          "  -  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textScaleFactor: 3,
                        ),
                        new Image.asset(
                          iconMapping[games[index].awayTeam.id],
                          width: 75.0,
                          height: 75.0,
                        ),
                      ],
                    ),
                  ),
                  Container(child: Text(formatDate(games[index].date, [HH, ':', nn, ' Uhr']))),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Game>> fetchGames(http.Client client) async {
    final response = await client.get(
        "http://" + ip + ":8080/game/getAllSorted");

    if (response.statusCode == 200) {
      return parseGames(response.body);
    } else {
      throw Exception("Failed to load");
    }
  }

  List<Game> parseGames(String responseBody) {
    print(responseBody);
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    var result = (parsed as List).map((entry) => Game.fromJson(entry)).toList();
    print("parsed: " + result.length.toString());
    return result;
  }
}
