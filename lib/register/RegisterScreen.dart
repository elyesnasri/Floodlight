import 'package:floodlight/register/DriverScreen.dart';
import 'package:flutter/material.dart';

import 'DriverScreen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
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
          body: DriverScreen(),
          // body: TabBarView(
          //   children: [
          //     Container(
          //       child: DriverScreen(),
          //     ),
          //     // DriverScreen(),
          //     //Passenger body
          //     Container(
          //       margin: EdgeInsets.symmetric(vertical: 20.0),
          //       child: Text(
          //         'Mitfahrt finden',
          //         textAlign: TextAlign.center,
          //         overflow: TextOverflow.ellipsis,
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
