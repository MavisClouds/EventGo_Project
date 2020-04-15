import 'package:flutter/material.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Style_register();
  }
}

//======================================== Style Register ================================
TextEditingController emailcontroller = TextEditingController();
TextEditingController usernamecontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController confirmpasswordcontroller = TextEditingController();

class Style_register extends StatefulWidget {


  @override
  _Style_registerState createState() => _Style_registerState();
}

class _Style_registerState extends State<Style_register> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      hintText: "Email", border: OutlineInputBorder()),
                  onChanged: (value) {
                
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      hintText: "Username", border: OutlineInputBorder()),
                  onChanged: (value) {
                   
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: "Password", border: OutlineInputBorder()),
                  onChanged: (value) {
               
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: confirmpasswordcontroller,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder()),
                  onChanged: (value) {},
                ),
              ),
              RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    setState(() {
                  
                    });
                  }),
            ],
          ),
        ),
      )),
    );
  }



  void showalertdialog(String title, String messages) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(messages),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}

//=========================================== Custom Widget ==========================================

/*Widget formtext(String hints) {
  return Container(
    margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
    child: TextFormField(
      decoration:
          InputDecoration(hintText: hints, border: OutlineInputBorder()),
      onChanged: (value) {},
    ),
  );
}
*/
