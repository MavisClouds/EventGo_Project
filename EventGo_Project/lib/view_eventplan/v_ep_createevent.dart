import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'v_ep_dashboard.dart';

class Ep_createevent extends StatelessWidget {
  const Ep_createevent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Style_createevent(),
    );
  }
}

//==============================================Style Create Event =============================

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ep_dashboard()),
          );
        },
      ),
      body: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          formtext("Event Title"),
          textfield(),
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
      ),
    );
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

Widget textfield() {
  return Container(
    margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
    child: TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: 'Describe Your Event'),
      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 50),
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
