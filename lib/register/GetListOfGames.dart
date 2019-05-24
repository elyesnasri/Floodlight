import 'package:flutter/material.dart';

class GetListOfGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 300,
                child: Text('Jan vs Hamburg'),
                alignment: Alignment(0.0, 0.0),
              ),
            ),
          ),
        ),
        Container(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 300,
                child: Text('Jan vs Kiel'),
                alignment: Alignment(0.0, 0.0),
              ),
            ),
          ),
        ),
        Container(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 300,
                child: Text('Jan vs Bayern'),
                alignment: Alignment(0.0, 0.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
