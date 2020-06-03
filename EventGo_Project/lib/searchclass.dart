import 'dart:convert';
import 'package:EventGo_Project/view_participator/v_detail_par.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String dropdownValue = 'Category';
  TextEditingController startdatecontroller = TextEditingController();
  TextEditingController enddatecontroller = TextEditingController();

  Future<List> getdata() async {
    final respones = await http.post("https://eventgo.pmh.web.id/filters.php",
    //final respones = await http.post("http://localhost/eventgo/filters.php",
        body: {'kategori': dropdownValue});

    // print(respones.toString());
    return json.decode(respones.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.amber),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Center(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.location_city),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Category',
                    'Computer',
                    'Academic',
                    'Culture',
                    'Sport'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Textstyles(value, 30, Colors.black));
                  }).toList(),
                ),
              ),
              new FutureBuilder(
                future: getdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  return snapshot.hasData
                      ? new Style_search(list: snapshot.data)
                      : new Center(
                          child: CircularProgressIndicator(),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Style_search extends StatelessWidget {
  const Style_search({this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
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
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Detail_par(list: list, index: i))),
                ),
              ),
            );
          },
        ));
  }
}
