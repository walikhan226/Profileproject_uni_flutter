import 'dart:io';
import 'package:flutter/material.dart';
import 'package:profileproject/addcourse.dart';
import 'package:profileproject/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profileproject/projects.dart';
import 'package:profileproject/viewcourse.dart';
import 'addprofile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _image;
  final picker = ImagePicker();

  int index = 0;

  double _width, _height;

  Widget mainUI() {
    if (index == 0) {
      return Addprofile();
    }
    if (index == 1) {
      return Container(
        child: Profile(),
      );
    }

    if (index == 2) {
      return Projects();
    }
    if (index == 3) {
      return Addcourse();
    }

    if (index == 4) {
      return Viewcourse();
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profile System"),
        backgroundColor: Colors.green,
      ),
      body: Center(child: mainUI()),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: ListView(
            children: [
              CircleAvatar(
                  maxRadius: 50, child: Image.asset("assets/images/logo.png")),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 30, bottom: 30),
                child: Text(
                  "Sir Syed University of Engineering and Technology",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    index = 0;
                  });

                  Navigator.pop(context);
                },
                leading: Icon(Icons.person, color: Colors.redAccent),
                title: Text("Add  Profile"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                  Navigator.pop(context);
                },
                leading:
                    Icon(Icons.camera_alt_outlined, color: Colors.redAccent),
                title: Text("Profile"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                  Navigator.pop(context);
                },
                leading: Icon(Icons.paste_rounded, color: Colors.redAccent),
                title: Text("Projects"),
              ),
          
           
            ],
          ),
        ),
      ),
    );
  }
}
