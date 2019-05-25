import 'package:flutter/material.dart';

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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _listViewData.length,
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
                              'lib/assets/Jahn_Logo.png',
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
                              teams[index].logoURI,
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
}
