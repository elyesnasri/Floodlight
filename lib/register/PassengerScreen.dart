import 'package:floodlight/register/ConfirmBuy.dart';
import 'package:floodlight/register/GetListOfGames.dart';
import 'package:flutter/material.dart';

class PassengerScreen extends StatefulWidget {
  createState() => _PassengerDemoState();
}

class _PassengerDemoState extends State<PassengerScreen> {
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
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
              height: 200.0,
              child: GetListOfGames()),
          _GetDriveLit(),
        ],
      ),
    );
  }
}

class _GetDriveLit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300.0,
      child: Scrollbar(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Hans'),
              subtitle: Text("3 Plätze frei"),
              trailing: Text("3€"),
              onTap: () => ConfirmBuy.showPopUp(context, "Platz buchen?",
                  "Jetzt noch den Platz ganz einfach buchen.", "weiter"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Wurst'),
              subtitle: Text("1 Platz frei"),
              trailing: Text("20€"),
              onTap: () => ConfirmBuy.showPopUp(context, "Platz buchen?",
                  "Jetzt noch den Platz ganz einfach buchen.", "weiter"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Lustig'),
              subtitle: Text("5 Plätze frei"),
              trailing: Text("25€"),
              onTap: () => ConfirmBuy.showPopUp(context, "Platz buchen?",
                  "Jetzt noch den Platz ganz einfach buchen.", "weiter"),
            ),
          ],
        ),
      ),
    );
  }
}
