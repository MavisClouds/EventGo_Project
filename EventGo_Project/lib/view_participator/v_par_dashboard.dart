import 'package:EventGo_Project/view_participator/v_detail_par.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Par_dashboard extends StatelessWidget {
  final List list;
  Par_dashboard({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Container(
            child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, i) {
            return new Card(
              child: ListTile(
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
    final respones = await http.get("http://192.168.1.65/mydata/getdata.php");
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
