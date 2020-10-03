import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                    top: 10,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Card(
                          elevation: 5,
                          child: TableCalendar(
                            initialCalendarFormat: CalendarFormat.week,
                            calendarStyle: CalendarStyle(
                              todayColor: Colors.orange,
                              selectedColor: Colors.deepOrange,
                              todayStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              selectedStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            headerStyle: HeaderStyle(
                              centerHeaderTitle: true,
                              formatButtonDecoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              formatButtonTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                              formatButtonShowsNext: false,
                            ),
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            onDaySelected: (date, events) {
                              print(date.toIso8601String());
                            },
                            calendarController: _calendarController,
                          ),
                        ),
                      ),
                      Welcome(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildClassItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
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
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, right: 30, left: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.2),
                  blurRadius: 12,
                  spreadRadius: 8,
                )
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80"),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hi Adan",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Here is a list of classes scheduled for\ntoday that you need to check...",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
