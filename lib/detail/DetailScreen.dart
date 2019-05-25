import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:floodlight/datamodel/Drive.dart';
import 'package:floodlight/datamodel/User.dart';
import 'package:floodlight/register/TeamData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(49.0023035, 12.0978763);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final Drive drive = ModalRoute.of(context).settings.arguments;
    final List<User> users = <User>[];
    users.add(drive.driver);
    drive.passengers.forEach((user) => users.add(user));

    final Set<Marker> _markers = {};
    var markerId = 0;
    _markers.add(Marker(
      markerId: MarkerId(markerId.toString()),
      position: LatLng(drive.driver.location.latitude, drive.driver.location.longitude),
      infoWindow: InfoWindow(
        title: drive.driver.name, snippet: "Startpunkt"
      )
    ));
    markerId++;
    drive.passengers.forEach((x) => _markers.add(
        new Marker(
          markerId: MarkerId(markerId.toString()),
          position: LatLng(x.location.latitude, x.location.longitude),
          infoWindow: InfoWindow(
            title: x.name, snippet: "Haltepunkt " + (markerId++).toString()
          )
        )));
    _markers.add(Marker(
        markerId: MarkerId((markerId++).toString()),
        position: LatLng(drive.game.destination.latitude, drive.game.destination.longitude),
        infoWindow: InfoWindow(
            title: drive.game.homeTeam.name, snippet: "Ziel")));
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.chat)),
                Tab(icon: Icon(Icons.info)),
                Tab(icon: Icon(Icons.place)),
              ],
            ),
            title: Text('Fahrtdetails'),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: FriendlychatApp()
              ),
              Tab(
                child:
                  Column(
                    children: <Widget>[
                      Container(
                        color: Color(0x99000000),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    new Image.asset(
                                      iconMapping[drive.game.homeTeam.id],
                                      width: 75.0,
                                      height: 75.0,
                                    ),
                                    Text(
                                      "  -  ",
                                      style:
                                        TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                        textScaleFactor: 3,
                                      ),
                                    new Image.asset(
                                      iconMapping[drive.game.awayTeam.id],
                                      width: 75.0,
                                      height: 75.0,
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child:
                                  Text(
                                    formatDate(drive.game.date, [HH, ':', nn, ' Uhr']),
                                    style:
                                      TextStyle(
                                      color: Colors.white
                                      ),
                                    textScaleFactor: 1.5,
                                  ),
                              ),
                              Container(
                                height: 2,
                                width: 600.0,
                                color: Colors.white30,
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                child:
                                Text(
                                  formatDate(drive.game.date, [dd, '.', mm, '.', yy]),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  textScaleFactor: 1.7,
                                ),
                              ),
                            ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Scrollbar(
                            child: ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, position) {
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      padding: position == 0 ? EdgeInsets.symmetric(vertical: 18.0) : EdgeInsets.symmetric(vertical: 12.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: position == 0 ? 1.5 : 0.2,
                                            color: position == 0 ? Colors.red : Colors.black,
                                          ),
                                        ),
                                      ),
                                      child: ListTile(
                                        title: Text(users[position].name),
                                        leading: position == 0 ? Icon(Icons.directions_car) : Icon(Icons.person),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              ),
              Tab(
                child: Container(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                    markers: _markers,
                  ),
                )
              ),
            ],
            physics: NeverScrollableScrollPhysics(),
          )
        )
    );
  }
}


final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

const String _name = "Your Name";

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ChatScreen();
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut
        ),
        axisAlignment: 0.0,
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(_name[0])),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(_name, style: Theme.of(context).textTheme.subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                  child: new Text("Send"),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )
                    : new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )),
          ]),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border:
              new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }

  Widget build(BuildContext context) {
    return new Container(
          child: new Column(
              children: <Widget>[
                new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    )
                ),
                new Divider(height: 1.0),
                new Container(
                  decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),
                ),
              ]
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS ? new BoxDecoration(border: new Border(top: new BorderSide(color: Colors.grey[200]))) : null);//new

  }
}
