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

    // TODO fill with actual user Data
    idController.text = "444";
    longController.text = "49.0192896";
    latController.text = "12.1012224";
    nameController.text = "Simon Burger";

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
    print("edited id");
    // TODO edit user data
  }

  void editName(String name) {
    print("edited name");
    // TODO edit user data
  }

  void editLongitude(String longitude) {
    print("edited longitude");
    // TODO edit user data
  }

  void editLatitude(String latitude) {
    print("edited latitude");

    // TODO edit user data
  }

}