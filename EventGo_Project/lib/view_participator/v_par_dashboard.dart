import 'package:EventGo_Project/view_participator/v_detail_par.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class Par_dashboard extends StatelessWidget {
  final List list;
  final int index;
  String idevent;
  
  Par_dashboard({this.list, this.index});

  Future<void> joindata() async {
    var url = "https://eventgo.pmh.web.id/joinevent.php";
    //var url = "http://localhost/eventgo/joinevent.php";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String idaccount = prefs.getString('idaccount');
    print(idaccount);
    http.post(url, body: {
      "idacc": idaccount,
      "idevent": idevent,
    });
  }

  Future<List> cekjoin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String idaccount = prefs.getString('idaccount');
    print(idaccount);
    final respones = await http.post(
        "https://eventgo.pmh.web.id/cekjoin.php",
        //"http://localhost/eventgo/cekjoin.php",
        body: {'idacc': idaccount,
               'idevent': idevent});

    // print(respones.toString());
    return json.decode(respones.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 0,
        child: Container(
            child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, i) {
            return new Card(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.amber)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                  leading: Icon(Icons.event),
                  title: Text(list[i]["nama_event"]),
                  subtitle: Text(list[i]["deskripsi_event"]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail_par(
                                  list: list,
                                  index: i,
                                )));
                  },
                ),
                ButtonBar(
                  children: <Widget>[
                    
                    FlatButton(
                      child: const Text('Ikuti Event'),
                      onPressed: () { 
                        idevent = list[i]["idevent"];
                        joindata(); },
                    ),
                  ],
                ),
                ],
              ),
              )
              
            );
          },
        )),
      ),
    );
  }
}

//========================================= Dashboard Data ===========================================

class Data_pardashboard extends StatefulWidget {
  Data_pardashboard({Key key}) : super(key: key);

  @override
  _Data_dashboardState createState() => _Data_dashboardState();
}

class _Data_dashboardState extends State<Data_pardashboard> {
  Future<List> getdata() async {
    final respones = await http.get("https://eventgo.pmh.web.id/getdata.php");
    //final respones = await http.get("http://localhost/eventgo/getdata.php");
    // print(respones.toString());
    return json.decode(respones.body);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new FutureBuilder(
      future: getdata(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new Par_dashboard(list: snapshot.data)
            : new Center(
                child: CircularProgressIndicator(),
              );
      },
    ));
  }
}
