import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/widgets/teacher.dart';

class Teachers extends StatefulWidget {
  @override
  _TeachersState createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {

  SharedPreferences prefs;
  List teachers;
  TextEditingController _teacherController = TextEditingController();

  // initPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  //   setState(() {

  //   });
  // }

    @override
  void initState() {
    super.initState();
    _teacherController = TextEditingController();
    teachers = [];
    // initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        backgroundColor: Colors.orange,
        tooltip: "Add a new teacher",
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Ateacher(),
            Ateacher(),
            Ateacher(),
            Ateacher(),
          ],
        ),
      ),
    );
  }

  _showDialog() async {
    await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Container(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: _teacherController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Enter lesson Title';
                              }
                            },
                            cursorColor: Colors.orange,
                            decoration: InputDecoration(
                              fillColor: Colors.orange,
                              focusColor: Colors.orange,
                              hoverColor: Colors.orange,
                              labelText: "Lesson",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              elevation: 5,
                              color: Colors.orange,
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (_teacherController.text.isEmpty) return; 
                                _teacherController.clear();
                                Navigator.pop(context);
                              },
                            ),
                            RaisedButton(
                              elevation: 5,
                              color: Colors.orange,
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
