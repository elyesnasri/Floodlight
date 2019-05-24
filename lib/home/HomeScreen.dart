import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          title: Text("Hello " + _user.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                if (_hiddenUserSettingsCounter < 3) {
                  _hiddenUserSettingsCounter++;
                } else {
                  _hiddenUserSettingsCounter = 0;
                  print("Enter unser data");
                  // TODO: Implement change of user data
                }
              },
            ),
          ],
        ),
        
        body: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  "Deine anstehenden Events:", 
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.red
                  ),
                ),
                
              ),
              
              padding: EdgeInsets.symmetric(vertical: 12.0),
              width: double.infinity,
            ),
            Divider(

            ),

            Container(
              height: 300.0,
              child: FutureBuilder<List<FootballEvent>>(
                future: fetchEventData(), 
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? ListViewFootballEvents(footballEvents: snapshot.data,)
                      : Center(child: CircularProgressIndicator());
                },

              ),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.detailScreen);
              },
              color: Colors.red,
              child: Text(
                "To DetailScreen",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.registerDriverScreen);
          },
          child: Icon(
            Icons.add
          ),
        ),
      ),
    );
  }

  Future<List<FootballEvent>> fetchEventData() async {
    final response = await FootballEvent_dummy.getDummyData();

    return response;
  }

}

class ListViewFootballEvents extends StatelessWidget {
  final List<FootballEvent> footballEvents;

  ListViewFootballEvents({
    Key key,
    this.footballEvents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: footballEvents.length,
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              Divider(height: 5.0),
              ListTile(
                title: Text("${footballEvents[position].homeTeam} - ${footballEvents[position].againstTeam}\nDatum: ${footballEvents[position].date}"),
                leading: footballEvents[position].isDriver ? Icon(Icons.directions_car) : Icon(Icons.person),
                onTap: () {
                  
                  Navigator.of(context).pushNamed(Routes.detailScreen);
                },
              )
            ],
          );
        },
      ),
    );
  }

}