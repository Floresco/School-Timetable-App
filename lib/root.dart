import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timetable_app/homepage.dart';
import 'package:timetable_app/widgets/classes.dart';
import 'package:timetable_app/widgets/myDrawer.dart';
import 'package:timetable_app/widgets/teachers.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "School Timetable",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 5,
            backgroundColor: Colors.orange,
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Home"),
                Tab(text: "Teachers"),
                Tab(text: "Classes"),
              ],
            ),
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            children: [
              MyHomePage(),
              Teachers(),
              Classes(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(.1))
            ]),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
                child: GNav(
                    gap: 30,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 5),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: Colors.orange,
                    tabs: [
                      GButton(
                        icon: LineIcons.calendar,
                        text: 'Timetable',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
