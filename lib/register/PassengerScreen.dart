import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:floodlight/data/DriveData.dart';
import 'package:floodlight/data/UserData.dart';
import 'package:floodlight/datamodel/Drive.dart';
import 'package:floodlight/datamodel/Game.dart';
import 'package:floodlight/datamodel/Location.dart';
import 'package:floodlight/register/ConfirmBuy.dart';
import 'package:floodlight/register/GetListOfGames.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Game passengerScreenGameGlobal;


class PassengerScreen extends StatefulWidget {
  createState() => _PassengerState();
}

class _PassengerState extends State<PassengerScreen> {

  int maxTimeWaiting = 30000;
  int waitedFor = 0;

  Future<List<Drive>> fetchDrives(http.Client client) async {
    while(passengerScreenGameGlobal == null && waitedFor <= maxTimeWaiting) {
      int start = DateTime.now().millisecondsSinceEpoch;

      print(passengerScreenGameGlobal);

      await Future.delayed(const Duration(milliseconds: 500), () => print(waitedFor));

      waitedFor += DateTime.now().millisecondsSinceEpoch - start;
    }

    Location location = mainUser.location;
    final response = await client.get(
        "http://" + ip + ":8080/drive/getPossibleDrives?gameId=" + passengerScreenGameGlobal.id + "&longitude=" + location.longitude.toString() + "&latitude=" + location.latitude.toString());

    if (response.statusCode == 200) {
      return parseDrives(response.body);
    } else {
      throw Exception("Failed to load");
    }
  }

  List<Drive> parseDrives(String responseBody) {
    print(responseBody);
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    var result = (parsed as List).map((entry) => Drive.fromJson(entry)).toList();
    print("parsed: " + result.length.toString());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: new Text(
              'Mitfahrt finden',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: GetListOfGames(onSelectedCallback: (arg) => passengerScreenGameGlobal = arg)),
          ),
          FutureBuilder<List<Drive>>(
            future: fetchDrives(http.Client()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListViewFootballEvents(driveEvents: snapshot.data);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("${snapshot.error}");
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

class ListViewFootballEvents extends StatelessWidget {
  final List<Drive> driveEvents;

  ListViewFootballEvents({
    Key key,
    this.driveEvents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: driveEvents.length,
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.2,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(
                      "${driveEvents[position].game.homeTeam.name} - ${driveEvents[position].game.awayTeam.name}\n${formatDate(driveEvents[position].game.date, [dd, '.', mm, '.', yy, ' ', HH, ':', nn, ' Uhr'])}"),
                  leading:
                  driveEvents[position].driver.username == mainUser.username
                      ? Icon(Icons.directions_car)
                      : Icon(Icons.person),
                  onTap: () {
                    ConfirmBuy.showPassengerPopup(context, "Platz buchen?",
                        "Jetzt noch den Platz ganz einfach buchen.", "weiter", driveEvents[position]);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

/*
* ConfirmBuy.showDriverPopUp(context, "Platz buchen?",
                  "Jetzt noch den Platz ganz einfach buchen.", "weiter")
* */
