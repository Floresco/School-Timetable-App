import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timetable_app/homepage.dart';
import 'package:timetable_app/Schedule.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    Schedule(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "School Timetable",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                radius: 100,
                child: Image(
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/Abdi-Adan/LiteCart/master/assets/Schedule/as.png'),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Schedule a new Lesson",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            child: RaisedButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Schedule",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              color: Colors.orange,
                                            ),
                                          ),
                                          SizedBox(
                                            child: RaisedButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text("Abdi Adan"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('E-mail'),
              subtitle: Text("adanabdi036@gmail.com"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings_power),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
            child: GNav(
                gap: 20,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.orange,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.calendar,
                    text: 'Schedule',
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
    );
  }
}
