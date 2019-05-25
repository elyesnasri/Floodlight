import 'dart:async';
import 'dart:convert';

import 'package:floodlight/datamodel/Drive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0;

  Duration animationDuration = Duration(milliseconds: 1500);

  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 3), onClose);
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(), () {
      setState(() {
        opacity = 1;
      });
    });


    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: AnimatedOpacity(
        duration: animationDuration,
        opacity: opacity,
        child: new Stack(
          children: <Widget>[
            new Image.asset(
              'lib/assets/Jahn_Logo.png',
              width: 175.0,
              height: 175.0,
            ),
          ],
        ),
      ),
    );
  }

  void onClose() {
    Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
  }
}

/*
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
        ),*/
