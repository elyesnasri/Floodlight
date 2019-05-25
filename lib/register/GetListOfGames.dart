import 'dart:convert';

import 'package:floodlight/data/DriveData.dart';
import 'package:floodlight/datamodel/Game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'TeamData.dart';

class GetListOfGames extends StatefulWidget {
  @override
  _GetListOfGamesState createState() => _GetListOfGamesState();
}

class _GetListOfGamesState extends State<GetListOfGames> {
  int _selectedIndex = 0;
  final List<String> _listViewData = [
    "03.05.2019",
    "12.06.2019",
    "04.09.2019",
  ];

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
    print(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder<List<Game>>(
      future: fetchGames(http.Client()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return buildListView(snapshot.data);
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
          color: _selectedIndex != null && _selectedIndex == index
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
                  Container(child: Text(_listViewData[index])),
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
