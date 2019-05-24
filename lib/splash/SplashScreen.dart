import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
      child: new Scaffold(
        appBar: AppBar(
          title: Text("Ur mum gay!"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("To Home"),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
                },
              ),
              RaisedButton(
                child: Text("To Detail"),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.detailScreen);
                },
              ),
              RaisedButton(
                child: Text("To Register Driver"),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.registerDriverScreen);
                },
              ),
              RaisedButton(
                child: Text("To Register Passenger"),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.registerPassengerScreen);
                },
              ),
            ],
          )
        ),
      )
    );
  }

}