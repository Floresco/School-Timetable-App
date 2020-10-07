import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class LessonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "07:00 am",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "08:00 am",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.transparent,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  "The Basic of Typography II",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Icon(
                    Icons.class_,
                    color: Colors.orange,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Class: Biology",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Icon(
                    LineIcons.pencil_square_o,
                    color: Colors.orange,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    " Teacher: Gabriel Sutton",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}