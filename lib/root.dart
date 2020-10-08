import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timetable_app/Pages/homepage.dart';
import 'package:timetable_app/auth/signup.dart';
import 'package:timetable_app/Pages/classes.dart';
import 'package:timetable_app/Pages/teachers.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange,
        accentColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
            actions: [
              InkWell(
                onTap: () async {
                  final FirebaseUser user = await _auth.currentUser();
                  if (user == null) {
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUp()));
                    debugPrint("There is no current user signed In");
                    return;
                  }
                  await _auth.signOut();
                  final String uid = user.uid;
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUp()));
                  debugPrint(uid + "user signed Out Successfully");
                },
                child: Icon(LineIcons.sign_out),
              ),
              SizedBox(
                width: 20,
              )
            ],
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
            decoration: BoxDecoration(color: Colors.transparent),
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

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              radius: 100,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://raw.githubusercontent.com/Abdi-Adan/LiteCart/master/assets/profile/as.png',
                ),
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
                // InkWell(
                //   onTap: () {
                //     showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           return Dialog(
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(10.0)),
                //             child: Container(
                //               height: 200,
                //               child: Padding(
                //                 padding: const EdgeInsets.all(12.0),
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment:
                //                       CrossAxisAlignment.center,
                //                   children: [
                //                     Text(
                //                       "Schedule a new Lesson",
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 20),
                //                     ),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceAround,
                //                       children: [
                //                         SizedBox(
                //                           child: RaisedButton(
                //                             onPressed: () {},
                //                             child: Text(
                //                               "Schedule",
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                             color: Colors.orange,
                //                           ),
                //                         ),
                //                         SizedBox(
                //                           child: RaisedButton(
                //                             onPressed: () {},
                //                             child: Text(
                //                               "Cancel",
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                             color: Colors.deepOrange,
                //                           ),
                //                         ),
                //                       ],
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           );
                //         });
                //   },
                //   child: Icon(
                //     Icons.edit,
                //     color: Colors.grey,
                //   ),
                // ),
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
          InkWell(
            onTap: () {
              // TODO Impliment Signout flow on actions in appbar here
            },
            child: ListTile(
              leading: Icon(Icons.settings_power),
              title: Text('Logout'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
