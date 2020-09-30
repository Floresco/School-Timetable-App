import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "School Timetable",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.menu),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text("Test Build"),
      ),
    );
  }
}
