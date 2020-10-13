import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addcourse extends StatefulWidget {
  @override
  _AddcourseState createState() => _AddcourseState();
}

class _AddcourseState extends State<Addcourse> {
  List<String> courses = [
    "Applied Physics",
    "English",
    "PST",
    "ISLAMIAT",
    "Programming",
    "OOP",
    "LDST",
    "Basic Electronics",
    "Mobile Application Development",
    "Operation Reasearch",
    "Game development",
    "Computer Graphics",
    "Data Communication and Networking",
    "Network Security",
    "Software Engineering",
    "Artifical Intellegence"
  ];
  Icon icon;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
      ..removeCurrentSnackBar()
      ..showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text(courses[index]),
              trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    List<String> list = prefs.getStringList("course");

                    if (list.contains(courses[index])) {
                      showInSnackBar("Item already in list");
                      return;
                    } else {
                      list.add(courses[index]);
                    }

                    prefs.setStringList("course", list);
                    showInSnackBar(courses[index] + " Course added");
                  }),
            ),
          );
        },
      ),
    );
  }
}
