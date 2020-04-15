import 'package:flutter/material.dart';
import 'view_eventplan/v_ep_dashboard.dart';
import 'view_participator/v_par_dashboard.dart';
import 'package:EventGo_Project/view_administration/v_register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Testbutton(),
    );
  }
}

class Testbutton extends StatefulWidget {
  Testbutton({Key key}) : super(key: key);

  @override
  _TestbuttonState createState() => _TestbuttonState();
}

class _TestbuttonState extends State<Testbutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80.0,
            color: Colors.black,
            child: FlatButton(
              color: Colors.amberAccent,
              child: Text("Event Planner"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ep_dashboard()),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 80.0,
            color: Colors.black,
            child: FlatButton(
              color: Colors.amberAccent,
              child: Text("Event Participator"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Style_pardashboard()),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 80.0,
            color: Colors.black,
            child: FlatButton(
              color: Colors.amberAccent,
              child: Text("Register"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Style_register()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
