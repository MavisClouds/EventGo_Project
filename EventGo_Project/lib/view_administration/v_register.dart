import 'package:flutter/material.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';
import 'package:http/http.dart' as http;

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Style_register(),
    );
  }
}

//======================================== Register Data ================================
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

  void Adddata() {
    var url = "https://eventgo.pmh.web.id/adddata.php";
    //var url = "http://localhost/eventgo/adddata.php";
    http.post(url, body: {
      "email": emailcontroller.text,
      "username": usernamecontroller.text,
      "password": passwordcontroller.text
    });
    showalertdialog("Succesfully", "Registered");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
      children: [
        Column(
          children: [
            formtext("Email", emailcontroller, false),
            formtext("Username", usernamecontroller, false),
            formtext("Password", passwordcontroller, true),
            formtext("Confirm Password", null, true),
            Container(
              height: 10,
            ),
            FlatButton(
              child: Text("SignUp",
                  style: TextStyle(
                      fontFamily: 'frenchcanon',
                      fontSize: 30,
                      color: Colors.black)),
              color: Colors.grey[200],
              onPressed: () {
                Adddata();
              },
            )
          ],
        ),
      ],
    )));
  }

  void show() {
    print(emailcontroller.text);
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
