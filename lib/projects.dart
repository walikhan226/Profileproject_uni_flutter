
import 'package:flutter/material.dart';
class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  double _width, _height;

  @override
  Widget build(BuildContext context) {
        _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;
    return Column(
        children: [
          Container(
            color: Colors.red,
            height: _height / 3,
            width: _width,
            child: Center(
                child: Text(
              "My Projects",
              style: TextStyle(color: Colors.white, fontSize: _width * 0.05),
            )),
          ),
          Card(
            child: ListTile(
              title: Text("Object Oriented Project"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Database Project"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("LDST Project"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Mobile Application Development Projects"),
            ),
          ),
        ],
      );
  }
}