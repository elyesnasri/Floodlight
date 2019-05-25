import 'package:floodlight/data/DriveData.dart';
import 'package:floodlight/data/UserData.dart';
import 'package:floodlight/datamodel/Drive.dart';
import 'package:floodlight/datamodel/Game.dart';
import 'package:floodlight/datamodel/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ConfirmBuy {
  static void createDrive(http.Client client, Game game, int seats) {
    User user = mainUser;

    client.post("http://" + ip + ":8080/drive/create?username=" + mainUser.username + "&gameId=" + game.id + "&longitude=" + user.location.longitude.toString() + "&latitude=" + user.location.latitude.toString() + "&meterRange=" + 7500.0.toString() + "&seats=" + seats.toString());
  }
  
  static void addPassenger(http.Client client, Drive drive) {
    User user = mainUser;

    client.post("http://" + ip + ":8080/drive/addPassenger?driveId=" + drive.driveId + "&username=" + user.username + "&longitude=" + user.location.longitude.toString() + "&latitude=" + user.location.latitude.toString());
  }
  
  static void showDriverPopUp(
      BuildContext context, String title, String content, String button, Game game, int seats) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(content),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(button),
                onPressed: () {
                  createDrive(http.Client(), game, seats);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  static void showPassengerPopup(
      BuildContext context, String title, String content, String button, Drive drive) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(content),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(button),
                onPressed: () {
                  addPassenger(http.Client(), drive);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
