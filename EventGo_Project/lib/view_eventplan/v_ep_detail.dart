import 'package:EventGo_Project/main.dart';
import 'package:flutter/material.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Ep_detail extends StatefulWidget {
  final List list;
  final int index;

  Ep_detail({this.list, this.index});

  @override
  _Ep_detailState createState() => _Ep_detailState();
}

class _Ep_detailState extends State<Ep_detail> {
  TextEditingController titlecontroller;
  TextEditingController desccontroller;
  TextEditingController startdatecontroller;
  TextEditingController enddatecontroller;
  TextEditingController locationcontroller;
  String dropdownValue;

  @override
  void initState() {
    titlecontroller = new TextEditingController(
        text: widget.list[widget.index]["nama_event"]);
    desccontroller = new TextEditingController(
        text: widget.list[widget.index]["deskripsi_event"]);
    startdatecontroller = new TextEditingController(
        text: widget.list[widget.index]["tanggal_mulai"]);
    enddatecontroller = new TextEditingController(
        text: widget.list[widget.index]["tanggal_selesai"]);
    locationcontroller =
        new TextEditingController(text: widget.list[widget.index]["lokasi"]);
    dropdownValue = widget.list[widget.index]["kategori"];
    super.initState();
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: Textstyles(
          "Are you sure want to delete ${widget.list[widget.index]["nama_event"]}",
          20,
          Colors.black),
      actions: [
        new RaisedButton(
          child: Icon(Icons.check_circle_outline),
          onPressed: () {
            deletedata();
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.pop(context);
          },
        ),
        new RaisedButton(
          child: Icon(Icons.remove_circle_outline),
          onPressed: () {
            return Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  Future<void> deletedata() async {
    var url = "https://eventgo.pmh.web.id/deletedataevent.php";
    //var url = "http://localhost/eventgo/deletedataevent.php";
    http.post(url, body: {
      "idevent": widget.list[widget.index]["idevent"],
    });
  }

  Future<void> updatedata() async {
    var url = "https://eventgo.pmh.web.id/updatedata.php";
    //var url = "http://localhost/eventgo/updatedata.php";
    http.post(url, body: {
      "idevent": widget.list[widget.index]["idevent"],
      "nama_event": titlecontroller.text,
      "deskripsi_event": desccontroller.text,
      "tanggal_mulai": startdatecontroller.text,
      "tanggal_selesai": enddatecontroller.text,
      "lokasi": locationcontroller.text,
      "kategori": dropdownValue
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: "Update",
            backgroundColor: Colors.amber,
            onTap: () {
              updatedata();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.delete),
            label: "Delete",
            backgroundColor: Colors.amber,
            onTap: () {
              confirm();
            },
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.amber)),
                      child:
                          formtext("Title", titlecontroller, false, "Title"))),
              Container(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.amber)),
                    child: formtext("Start Date", startdatecontroller, false,
                        "Start Date")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.amber)),
                    child: formtext(
                        "End Date", enddatecontroller, false, "End Date")),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.location_city),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.amber)),
                    child: formtext(
                        "Location", locationcontroller, false, "Location")),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.amber)),
                width: double.infinity,
                height: 300,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: formtext("Description", desccontroller, false,
                            "Description")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
