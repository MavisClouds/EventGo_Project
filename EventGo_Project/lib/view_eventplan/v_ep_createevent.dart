import 'package:flutter/material.dart';
import 'v_ep_dashboard.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';

class Ep_createevent extends StatelessWidget {
  const Ep_createevent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Style_createevent();
  }
}

//============================================== Create Event Data =============================

class Style_createevent extends StatefulWidget {
  Style_createevent({Key key}) : super(key: key);

  @override
  _Style_createeventState createState() => _Style_createeventState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _Style_createeventState extends State<Style_createevent> {
  final _formKey = GlobalKey<FormState>();

  String initvalue;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  TextEditingController startdatecontroller = TextEditingController();
  TextEditingController enddatecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_right),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            formtext("Event Title", titlecontroller, false),
            formtext("Describe Your Event", desccontroller, false),
            datetime("Start Date", startdatecontroller),
            datetime("End Date", enddatecontroller),
            formtext("Location", locationcontroller, false)
          ]),
        ));
  }

  void back() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Ep_dashboard();
    }));
  }
}

//======================================== Custom Widget =======================================


