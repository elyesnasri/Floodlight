import 'package:floodlight/register/ConfirmBuy.dart';
import 'package:floodlight/register/GetListOfGames.dart';
import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  createState() => _NumberCountDemoState();
}

class _NumberCountDemoState extends State<DriverScreen> {
  int _n = 0;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: new Text(
              'Fahrt anbieten',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
            height: 200.0,
            child: GetListOfGames(),
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
                      if (_n < 1) {
                        _isVisible = false;
                      }
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
                    if (_n >= 1) {
                      _isVisible = true;
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          onPressed: () {
            ConfirmBuy.showPopUp(context, "Fahrt veröftlichen?",
                "Andere können sich bei dir melden.", "weiter");
          },
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}
