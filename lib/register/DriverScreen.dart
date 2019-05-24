import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  createState() => _NumberCountDemoState();
}

class _NumberCountDemoState extends State<DriverScreen> {
  int _n = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: new Text(
              'Fahrt anbieten',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
            height: 400.0,
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
          new Text(
            'Anzahl freie Plätze:',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.minimize),
                onPressed: () {
                  setState(() {
                    if (_n != 0 && _n != 1) {
                      _n--;
                    }
                  });
                },
              ),
              Text('$_n', style: TextStyle(fontSize: 60.0)),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _n++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
