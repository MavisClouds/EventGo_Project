import 'package:EventGo_Project/view_administration/start_page.dart';
import 'package:flutter/material.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view_participator/v_par_dashboard.dart';
import 'view_eventplan/v_ep_dashboard.dart';
import 'main.dart';

class Dashboard_c extends StatefulWidget {
  final bool login;
  Dashboard_c({Key key, @required this.login}) : super(key: key);

  @override
  _Dashboard_cState createState() => _Dashboard_cState(login);
}

class _Dashboard_cState extends State<Dashboard_c> {
  bool participator = true;
  bool loggedin;
  bool createevent = false;

  _Dashboard_cState(this.loggedin);

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isloggedin = prefs.getBool('isloggedin');

    if (isloggedin != null) {
      setState(() {
        loggedin = isloggedin;
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isloggedin', false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: loggedin
            ? Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      icon: Icon(Icons.arrow_left),
                      onPressed: () {
                        logout();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    )
                  ],
                  backgroundColor: Colors.amber,
                  title: participator
                      ? Textstyles("Participator", 25, Colors.black)
                      : Textstyles("Event Planner", 25, Colors.black),
                ),
                drawer: Drawer(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Textstyles("Participator", 25, Colors.black),
                        onTap: () {
                          setState(() {
                            participator = true;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Textstyles("Event Planner", 25, Colors.black),
                        onTap: () {
                          setState(() {
                            participator = false;
                          });
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                body: participator ? Data_pardashboard() : Ep_dashboard(),
              )
            : Start_page());
  }
}
