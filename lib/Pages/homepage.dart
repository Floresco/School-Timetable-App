import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timetable_app/Pages/insertEvent.dart';
import 'package:timetable_app/widgets/welcome.dart';
import 'package:timetable_app/widgets/lessonCard.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => InsertEvent()));
        },
      ),
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
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Pull to refresh, swipe cards to dismiss/delete lesson schedule",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return LessonCard();
                      },
                      itemCount: 10,
                    ),
                  ),
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
}
