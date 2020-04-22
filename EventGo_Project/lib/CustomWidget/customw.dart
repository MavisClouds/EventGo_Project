import 'package:flutter/material.dart';

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
