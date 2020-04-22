import 'package:EventGo_Project/view_eventplan/v_ep_createevent.dart';
import 'package:flutter/material.dart';
import 'package:EventGo_Project/dashboard_conector.dart';

class Ep_dashboard extends StatelessWidget {
  const Ep_dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Event Planner Dashboard",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Style_epdashboard(),
        '/createevent': (BuildContext context) => Style_createevent()
      },
    );
  }
}

//===================================== Style ep dashboard =================================

class Style_epdashboard extends StatelessWidget {
  const Style_epdashboard({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/createevent'
            );
          },
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, 0.0),
              child: Icon(Icons.calendar_today),
            ),
            Align(
              alignment: Alignment(0.0, 0.1),
              child: Textsstyles("Add Your Event Today", 30.0),
            )
          ],
        ));
  }
}

//===================================== Custom Widget =========================================

Widget Textsstyles(String placers, double sizers) {
  return Text(
    placers,
    style: TextStyle(fontFamily: 'frenchcanon', fontSize: sizers),
  );
}
