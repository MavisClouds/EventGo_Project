import 'package:EventGo_Project/view_eventplan/v_ep_createevent.dart';
import 'package:flutter/material.dart';

class ep_dashboard extends StatelessWidget {
  const ep_dashboard({Key key}) : super(key: key);

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
          title: Text("Event Planner Dashboard"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ep_createevent()),
            );},
        ));
  }
}
