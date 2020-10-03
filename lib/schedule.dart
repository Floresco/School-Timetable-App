import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Schedule extends StatefulWidget {
  @override
  ScheduleState createState() => ScheduleState();
}

class ScheduleState extends State<Schedule>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 170.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://raw.githubusercontent.com/Abdi-Adan/LiteCart/master/assets/profile/as.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 110.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Schedule Avatar',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Personal Information',
                                    style: TextStyle(
                                      fontSize: 20.5,
                                    ),
                                  ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 25.0, right: 25.0, top: 5),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Name',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Enter Your Name",
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 10.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Email address',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  decoration: const InputDecoration(
                                      hintText: "Enter email address"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.orange,
                      child: Text(
                        'Update Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.deepOrange,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.orange,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
