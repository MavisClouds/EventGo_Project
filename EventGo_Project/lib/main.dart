import 'package:flutter/material.dart';
import 'view_eventplan/v_ep_dashboard.dart';

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
      home: testbutton(),
    );
  }
}

class testbutton extends StatefulWidget {
  testbutton({Key key}) : super(key: key);

  @override
  _testbuttonState createState() => _testbuttonState();
}

class _testbuttonState extends State<testbutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 80.0,
        color: Colors.black,
        child: FlatButton(
          color: Colors.amberAccent,
          child: Text("Next"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ep_dashboard()),
            );
          },
        ),
      ),
    );
  }
}
