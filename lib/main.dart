import 'package:flutter/material.dart';

import 'package:profileproject/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

setdata() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var list = prefs.getStringList("course");

  if (list == null) {
    prefs.setStringList("course", []);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
setdata();
    return MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen());
  }
}
