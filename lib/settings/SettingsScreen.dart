import 'package:floodlight/data/UserData.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _settingsScreenState();
  }

}

class _settingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var idController = new TextEditingController();
    var nameController = new TextEditingController();
    var longController = new TextEditingController();
    var latController = new TextEditingController();

    idController.text = mainUser.username;
    longController.text = mainUser.location.longitude.toString();
    latController.text = mainUser.location.latitude.toString();
    nameController.text = mainUser.name;

    return Scaffold(
      appBar: AppBar(
        title: Text("Einstellungen"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Text("ID"),
            title: TextField(
              controller: idController,
              onSubmitted: (text) => editId(text),
            ),
          ),
          ListTile(
            leading: Text("Name"),
            title: TextField(
              controller: nameController,
              onSubmitted: (text) => editName(text),
            ),
          ),
          ListTile(
            leading: Text("Longitude"),
            title: TextField(
              controller: longController,
              onSubmitted: (text) => editLongitude(text),
            ),
          ),
          ListTile(
            leading: Text("Latitude"),
            title: TextField(
              controller: latController,
              onSubmitted: (text) => editLatitude(text),
            ),
          ),
        ],
      ),
    );
  }

  void editId(String id) {
    mainUser.username = id;
  }

  void editName(String name) {
    mainUser.name = name;
  }

  void editLongitude(String longitude) {
    mainUser.location.longitude = double.parse(longitude);
  }

  void editLatitude(String latitude) {
    mainUser.location.latitude = double.parse(latitude);
  }

}