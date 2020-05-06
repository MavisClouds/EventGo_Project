import 'package:flutter/material.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';

class Detail_par extends StatelessWidget {
  final List list;
  final int index;
  Detail_par({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(/*
      floatingActionButton: FloatingActionButton.extended(
        label: Textstyles("Submit", 25, Colors.white),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.amber,
        onPressed: () {},
      ),*/
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
              Textstyles("${list[index]['nama_event']}", 50, Colors.black),
              Container(
                height: 30,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textstyles(
                      "Start Date: ${list[index]["tanggal_mulai"]}",
                      25,
                      Colors.black),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textstyles(
                      "End Date: ${list[index]["tanggal_selesai"]}",
                      25,
                      Colors.black),
                ),
              ),Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textstyles(
                      "Location: ${list[index]["lokasi"]}",
                      25,
                      Colors.black),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textstyles(
                        "Deskripsi:\n ${list[index]["deskripsi_event"]}",
                        25,
                        Colors.black),
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
