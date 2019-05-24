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
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 300.0,
                  color: Colors.red,
                ),
                Container(
                  width: 300.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 300.0,
                  color: Colors.green,
                ),
                Container(
                  width: 300.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 300.0,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
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
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Wurst'),
              subtitle: Text("1 Platz frei"),
              trailing: Text("20€"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Lustig'),
              subtitle: Text("5 Plätze frei"),
              trailing: Text("25€"),
            ),
          ],
        ),
      ),
    );
  }
}
