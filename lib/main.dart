import 'package:floodlight/detail/DetailScreen.dart';
import 'package:floodlight/home/HomeScreen.dart';
import 'package:floodlight/register/RegisterPassengerScreen.dart';
import 'package:floodlight/register/RegisterScreen.dart';
import 'package:floodlight/settings/SettingsScreen.dart';
import 'package:floodlight/splash/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      initialRoute: Routes.splashScreen,
      routes: {
        Routes.splashScreen: (context) => SplashScreen(),
        Routes.homeScreen: (context) => HomeScreen(),
        Routes.detailScreen: (context) => DetailScreen(),
        Routes.registerScreen: (context) => RegisterScreen(),
        Routes.registerPassengerScreen: (context) => RegisterPassengerScreen(),
        Routes.settingsScreen: (context) => SettingsScreen()
      }
    );
  }
}

