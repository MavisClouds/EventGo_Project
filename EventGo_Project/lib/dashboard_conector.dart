import 'package:EventGo_Project/view_administration/start_page.dart';
import 'package:flutter/material.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';
import 'view_participator/v_par_dashboard.dart';
import 'view_eventplan/v_ep_dashboard.dart';

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
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: loggedin
            ? Scaffold(
                appBar: AppBar(
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
