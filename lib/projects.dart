
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
            color: Colors.green,
            height: _height / 3,
            width: _width,
            child: Center(
                child: Text(
              "My Projects",
              style: TextStyle(color: Colors.white, fontSize: _width * 0.05),
            )),
          ),
          ListTile(
            title: Text("Object Oriented Project"),
          ),
          ListTile(
            title: Text("Database Project"),
          ),
          ListTile(
            title: Text("LDST Project"),
          ),
          ListTile(
            title: Text("Mobile Application Development Projects"),
          ),
        ],
      );
  }
}