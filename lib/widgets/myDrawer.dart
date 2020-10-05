import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

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
            onTap: () async {
              final FirebaseUser user = await _auth.currentUser();
              if (user == null) {
                Scaffold.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("There is no current user signed In")),
                );
                return;
              }
              await _auth.signOut();
              final String uid = user.uid;
              Scaffold.of(context).showSnackBar(
                SnackBar(
                    content: Text(uid + " user has successfully signed out!")),
              );
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
