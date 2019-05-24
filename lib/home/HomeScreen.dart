import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../routes.dart';
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

}