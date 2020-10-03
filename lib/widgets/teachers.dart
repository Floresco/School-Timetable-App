import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
      body: ListView(
        children: [
          Ateacher(),
          Ateacher(),
          Ateacher(),
          Ateacher(),
          Ateacher(),
        ],
      ),
    );
  }
}

class Ateacher extends StatelessWidget {
  const Ateacher({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Icon(LineIcons.pencil_square_o, color: Colors.orange,),
          title: Text("Gabriel Stanton"),
          subtitle: Text("Class: Biology, Chemistry and Math"),
        ),
      ),
    );
  }
}
