import 'dart:convert';

import 'package:floodlight/data/DriveData.dart';
import 'package:floodlight/data/UserData.dart';
import 'package:floodlight/datamodel/Drive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

import '../routes.dart';
import 'FootballEvent.dart';
import 'User.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  User _user = new User(name: "Testboy", familyName: "One", location: null);
  int _hiddenUserSettingsCounter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Floodlight"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                if (_hiddenUserSettingsCounter < 3) {
                  _hiddenUserSettingsCounter++;
                } else {
                  _hiddenUserSettingsCounter = 0;
                  print("Enter unser data");
                  Navigator.of(context).pushNamed(Routes.settingsScreen);
                }
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text(
                  "Deine anstehenden Events:",
                  style: TextStyle(fontSize: 22.0, color: Colors.red),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.0),
              width: double.infinity,
            ),
            Container(
              height: 360.0,
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(),
              child: FutureBuilder<List<Drive>>(
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
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.registerScreen);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

void fetchEventData() async {
  drives = await fetchDrives(http.Client());
}

Future<List<Drive>> fetchDrives(http.Client client) async {
  final response = await client.get(
      "http://" + ip + ":8080/drive/getForUser?username=" + mainUser.username);

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
                    Navigator.of(context).pushNamed(Routes.detailScreen,
                        arguments: driveEvents[position]);
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
