import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String description = "";
  String filepath = "";

  getdata() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance().then((value) {
      setState(() {
        this.name = value.getString("name");
        this.description = value.getString("description");
        this.filepath = value.getString("image");
      });
    });
  }


_launchURL() async {
  const url = 'https://github.com/walikhan226/Profileproject_uni_flutter';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  void initState() {
    super.initState();
  getdata();
  }

  double _width, _height;
  File _image;
  final picker = ImagePicker();

  Widget decideImageiew() {
    if (filepath==null||filepath.isEmpty) {
      return Container(
          width: 140.0,
          height: 140.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.cover,
            ),
          ));
    } else {
      return Container(
          width: 140.0,
          height: 140.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              image: AssetImage(filepath),
              fit: BoxFit.cover,
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          decideImageiew(),
          SizedBox(
            height: 30,
          ),
          Text(
            name==null?'No name':name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text(
            description==null?'No description':description,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        



        ],
      ),
    );
  }
}
