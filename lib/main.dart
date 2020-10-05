import 'package:flutter/material.dart';
import 'package:timetable_app/auth/signup.dart';
// import 'package:timetable_app/root.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Timetable App', color: Colors.white,
      theme: ThemeData(
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange,
        accentColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUp(),
    );
  }
}
