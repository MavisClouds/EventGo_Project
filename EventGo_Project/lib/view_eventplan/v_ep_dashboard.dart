import 'package:EventGo_Project/view_eventplan/v_ep_createevent.dart';
import 'package:flutter/material.dart';

class Ep_dashboard extends StatelessWidget {
  const Ep_dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Event Planner Dashboard",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Style_dashboard(),
    );
  }
}

//================================= Style Activity ========================================

class Style_dashboard extends StatelessWidget {
  const Style_dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Event Planner Dashboard",
              style: TextStyle(fontFamily: 'frenchcanon')),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ep_createevent()),
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
