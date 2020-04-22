import 'package:EventGo_Project/dashboard_conector.dart';
import 'package:EventGo_Project/view_eventplan/v_ep_createevent.dart';
import 'package:flutter/material.dart';
import 'view_eventplan/v_ep_dashboard.dart';
import 'view_participator/v_par_dashboard.dart';
import 'package:EventGo_Project/view_administration/v_register.dart';
import 'package:EventGo_Project/view_administration/start_page.dart';
import 'package:EventGo_Project/view_administration/start_page.dart';

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
        primarySwatch: Colors.amber,
      ),
     initialRoute: '/',routes: {
        '/': (BuildContext context) => Dashboard_c(login: false,),
        '/participatord': (BuildContext context) => Data_pardashboard(),
        '/register': (BuildContext context)=> Register(),
        '/eventplannerd': (BuildContext context) => Ep_dashboard(),
      },
    );
  }
}

/*class Testbutton extends StatefulWidget {
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
                Navigator.pushNamed(context, '/eventplannerd'
                  
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
                Navigator.pushNamed(
                  context,
                  '/participatord'
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
                Navigator.pushNamed(
                  context,
                  '/register'
                );
              },
            ),
          ),Container(
            width: double.infinity,
            height: 80.0,
            color: Colors.black,
            child: FlatButton(
              color: Colors.amberAccent,
              child: Text("Register"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/login'
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
*/