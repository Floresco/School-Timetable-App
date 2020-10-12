import 'package:flutter/material.dart';

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        tooltip: "Add a new class",
        child: Icon(Icons.add, color: Colors.white,),
      ),
      body: GridView.count(
        crossAxisSpacing: 0.3,
        mainAxisSpacing: 0.3,
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(5, (index) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange,
              ),
              padding: EdgeInsets.all(40),
              child: Text(
                'Subject $index',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
