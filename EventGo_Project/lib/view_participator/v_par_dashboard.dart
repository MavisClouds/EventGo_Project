import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Par_dashboard extends StatelessWidget {
  final List list;
  Par_dashboard({this.list});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Card(
        child: Container(
            child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, i) {
            return new Card(
              child: ListTile(
                leading: Icon(Icons.event),
                title: Text(list[i]["kode_makanan"]),
                subtitle: Text(""),
              ),
            );
          },
        
        )),
      ),
    );
  }
}

//========================================= Dashboard Style ===========================================

class Style_pardashboard extends StatefulWidget {
  Style_pardashboard({Key key}) : super(key: key);

  @override
  _Style_dashboardState createState() => _Style_dashboardState();
}

class _Style_dashboardState extends State<Style_pardashboard> {
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
