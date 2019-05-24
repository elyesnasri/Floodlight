import 'package:floodlight/register/DriverScreen.dart';
import 'package:floodlight/register/PassengerScreen.dart';
import 'package:flutter/material.dart';

import 'DriverScreen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.airline_seat_recline_normal)),
              ],
            ),
            title: Text('Register'),
          ),
          body: TabBarView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: DriverScreen(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: PassengerScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
