import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InsertEvent extends StatefulWidget {
  @override
  _InsertEventState createState() => _InsertEventState();
}

class _InsertEventState extends State<InsertEvent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _lessonController = TextEditingController();
  String _teacher = "Teacher";
  String _class = "Class";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
        elevation: 5,
        centerTitle: true,
        title: Text(
          "Add new Lesson",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("Schedule a new Lesson"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _lessonController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter a title for your new lesson';
                      }
                    },
                    cursorColor: Colors.orange,
                    decoration: InputDecoration(
                      fillColor: Colors.orange,
                      focusColor: Colors.orange,
                      hoverColor: Colors.orange,
                      labelText: "Enter Lesson Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: FlatButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2020, 1, 1),
                          maxTime: DateTime(2021, 30, 12), onChanged: (date) {
                        print("date changed $date");
                      }, onConfirm: (date) {
                        print("date confirmed $date");
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text(
                      'Lesson StartTime',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: FlatButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2020, 1, 1),
                          maxTime: DateTime(2021, 30, 12), onChanged: (date) {
                        print("date changed $date");
                      }, onConfirm: (date) {
                        print("date confirmed $date");
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text(
                      'Lesson EndtTime',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: DropdownButton(
                        value: _teacher,
                        items: [
                          DropdownMenuItem(
                            child: Text("Mr. Santon Gabriel"),
                          ),
                          DropdownMenuItem(
                            child: Text("Mr. Adan Abdi"),
                          ),
                          DropdownMenuItem(
                            child: Text("Mr. Santon Gabriel"),
                          ),
                          DropdownMenuItem(
                            child: Text("Mr. Santon Gabriel"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _teacher = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: DropdownButton(
                        value: _class,
                        items: [
                          DropdownMenuItem(
                            child: Text("Biology"),
                          ),
                          DropdownMenuItem(
                            child: Text("Chemistry"),
                          ),
                          DropdownMenuItem(
                            child: Text("Biology"),
                          ),
                          DropdownMenuItem(
                            child: Text("Biology"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _class = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      elevation: 5,
                      color: Colors.orange,
                      child: Text(
                        "Create Lesson",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      elevation: 5,
                      color: Colors.deepOrange,
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
