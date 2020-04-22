import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
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
            formtext("Event Title"),
            formtext("Describe Your Event"),
            datetime("Start Date"),
            datetime("End Date"),
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: TextFormField(
                onTap: () async {
                  // show input autocomplete with selected mode
                  // then get the Prediction selected

                  Prediction p = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: "AIzaSyBHM1My2k4w0xxrQqv3LFuFh57PicEwHlA",
                      mode: Mode.overlay, // Mode.fullscreen
                      language: "id",
                      components: [new Component(Component.country, "id")]);

                  print(p.toString());

                  if (p != null) {
                    initvalue = p.toString();
                  }
                },
                decoration: InputDecoration(hintText: "Event Places"),
                initialValue: initvalue,
              ),
            ),
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

Widget formtext(String hints) {
  return Container(
    margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
    child: TextFormField(
      decoration:
          InputDecoration(hintText: hints, border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  );
}

Widget datetime(String hints) {
  return Container(
      margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: DateTimeField(
        decoration: InputDecoration(hintText: hints),
        format: DateFormat("yyyy-MM-dd"),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(2020),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ));
}
