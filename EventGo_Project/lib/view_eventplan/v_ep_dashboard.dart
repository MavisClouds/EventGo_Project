import 'dart:convert';

import 'package:EventGo_Project/view_eventplan/v_ep_createevent.dart';
import 'package:EventGo_Project/view_eventplan/v_ep_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Ep_dashboard extends StatelessWidget {
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

//===================================== Data ep dashboard =================================

class Style_epdashboard extends StatelessWidget {
  const Style_epdashboard({Key key}) : super(key: key);

  Future<List> getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String idaccount = prefs.getString('idaccount');
    print(idaccount);
    final respones = await http.post(
        "https://eventgo.pmh.web.id/showeventplan.php",
        body: {'idacc': idaccount});

    // print(respones.toString());
    return json.decode(respones.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Ep_createevent()));
          },
        ),
        body: new FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new Style_eventplan(list: snapshot.data)
                : new Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}

//===================================== Style Widget =========================================

class Style_eventplan extends StatelessWidget {
  const Style_eventplan({this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Card(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.amber)),
              child: ListTile(
                leading: Icon(Icons.event),
                title: Text(list[i]["nama_event"]),
                subtitle: Text(list[i]["deskripsi_event"]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Ep_detail(
                                list: list,
                                index: i,
                              )));
                },
              ),
            ),
          );
        },
      )),
    );
  }
}
