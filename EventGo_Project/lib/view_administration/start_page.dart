import 'package:flutter/material.dart';
import 'login.dart';
import 'v_register.dart';

class Start_page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(50),
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      "EventGo",
                      style: TextStyle(fontFamily: 'frenchcanon', fontSize: 50),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 3, 0, 30),
                      child: Text(
                        "Want Some Event ? Just Go !",
                        style:
                            TextStyle(fontFamily: 'frenchcanon', fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: TabBar(
                        tabs: [
                          Text("Sign In",
                              style: TextStyle(
                                  fontFamily: 'frenchcanon',
                                  fontSize: 30,
                                  color: Colors.black)),
                          Text("Sign Up",
                              style: TextStyle(
                                  fontFamily: 'frenchcanon',
                                  fontSize: 30,
                                  color: Colors.black))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: TabBarView(
                        children: [Login(), Register()],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}




