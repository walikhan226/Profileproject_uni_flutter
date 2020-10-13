import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addprofile extends StatefulWidget {
  @override
  _AddprofileState createState() => _AddprofileState();
}

class _AddprofileState extends State<Addprofile> {
  double _width, _height;
  FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController batchcontroller = TextEditingController();

  TextEditingController descriptioncontroller = TextEditingController();

  Widget textfield(String text, TextEditingController controller) {
    return Container(
        margin: EdgeInsets.only(top: 7, bottom: 7, left: 15, right: 15),
        child: TextFormField(
          controller: controller,
          autofocus: false,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: '$text',
            hintText: 'Enter your $text',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            filled: false,
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 7.0),
              child: Icon(
                Icons.email,
                color: Colors.red,
              ),
            ),
          ),
        ));
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImagegallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> showChoiceDialoglist(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: AlertDialog(
              title: Text('Make a Choice'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        getImagegallery();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        getImage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget decideImageiew() {
    if (_image == null) {
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
              image: AssetImage(_image.path),
              fit: BoxFit.cover,
            ),
          ));
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
      ..removeCurrentSnackBar()
      ..showSnackBar(new SnackBar(content: new Text(value)));
  }

  Widget button() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
        width: _width / 2,
        height: _height * 0.1,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.red,
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            if (namecontroller.text.isNotEmpty) {
              prefs.setString("name", namecontroller.text);
            } else {
              showInSnackBar("Please enter name");
              return;
            }

            if (batchcontroller.text.isNotEmpty) {
              prefs.setString("batch", batchcontroller.text);
            } else {
              showInSnackBar("Please enter batch");
              return;
            }

            if (batchcontroller.text.isNotEmpty) {
              prefs.setString("description", descriptioncontroller.text);
            } else {
              showInSnackBar("Please enter description");
              return;
            }

            if (_image == null ) {
              showInSnackBar("Please upload image");
              return;
            } else {
              prefs.setString("image", _image.path);
            }

showInSnackBar("Profile Added");

          },
          child: Text('Add Profile',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }

  Widget decideimage() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: _width / 5,
        height: _height * 0.05,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.red,
          onPressed: () {
            showChoiceDialoglist(context);
          },
          child: const Text('Upload Image',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              textfield("Name", namecontroller),
              textfield("Batch", batchcontroller),
              textfield("About Your self", descriptioncontroller),
              SizedBox(height: 30,),
              
              decideImageiew(),
              SizedBox(height: 30,),
              decideimage(),
              button()
            ],
          ),
        ),
      ),
    );
  }
}
