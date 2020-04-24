import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

Widget formtext(
    String hints, TextEditingController inputcontroller, bool hidden) {
  return Container(
    margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
    child: TextField(
      controller: inputcontroller,
      decoration:
          InputDecoration(hintText: hints, border: OutlineInputBorder()),
      onChanged: (value) {},
      obscureText: hidden,
    ),
  );
}

Widget Cflatbutton(String text) {
  return FlatButton(
    child: Text(text,
        style: TextStyle(
            fontFamily: 'frenchcanon', fontSize: 30, color: Colors.black)),
    color: Colors.grey[200],
    onPressed: () {},
  );
}

 

Widget Textstyles(String text, double fontsizes, Color color) {
  return Text(text,
      style: TextStyle(
          fontFamily: 'frenchcanon', fontSize: fontsizes, color: color));
}

Widget datetime(String hints, TextEditingController inputs) {
  return Container(
      margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: DateTimeField(controller: inputs,
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