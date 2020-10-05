import 'package:flutter/material.dart';
import 'package:timetable_app/auth/signin.dart';
import 'package:timetable_app/root.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "New to School Timetable? Signup",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    fillColor: Colors.orange,
                    focusColor: Colors.orange,
                    hoverColor: Colors.orange,
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    fillColor: Colors.orange,
                    focusColor: Colors.orange,
                    hoverColor: Colors.orange,
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    fillColor: Colors.orange,
                    focusColor: Colors.orange,
                    hoverColor: Colors.orange,
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    fillColor: Colors.orange,
                    focusColor: Colors.orange,
                    hoverColor: Colors.orange,
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SignIn()));
                        },
                        child: Text(
                          "SignIn",
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Root()));
                    },
                    elevation: 5,
                    color: Colors.orange,
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    elevation: 5,
                    color: Colors.white,
                    child: Text(
                      "Continue with Google",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
