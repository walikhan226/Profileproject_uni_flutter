import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Viewcourse extends StatefulWidget {
  @override
  _ViewcourseState createState() => _ViewcourseState();
}

class _ViewcourseState extends State<Viewcourse> {
  SharedPreferences prefs;
  List<String> list = [];
  getdata() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      this.list = prefs.getStringList("course");
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
      ..removeCurrentSnackBar()
      ..showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
      key: _scaffoldKey,
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
                      child: ListTile(
              leading: Text(list[index]),
              trailing: IconButton(
                onPressed: () {
                  showInSnackBar("course removed");

                  List<String> list = prefs.getStringList("course");

                  setState(() {
                    list.remove(list[index]);
                    prefs.setStringList("course", list);
                  });
                },
                icon: Icon(Icons.remove),
              ),
            ),
          );
        },
      ),
    );
  }
}
