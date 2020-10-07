import 'package:flutter/material.dart';
import 'package:timetable_app/widgets/teacher.dart';

class Teachers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        tooltip: "Add a new teacher",
        child: Icon(Icons.add),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Ateacher();
          },
        ),
      ),
    );
  }
}
