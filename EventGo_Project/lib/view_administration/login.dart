import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';
import 'package:http/http.dart' as http;
import 'package:EventGo_Project/dashboard_conector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Login_data();
  }
}

//============================================= Login Data ==============================================

class Login_data extends StatefulWidget {
  Login_data({Key key}) : super(key: key);

  @override
  _Login_dataState createState() => _Login_dataState();
}

class _Login_dataState extends State<Login_data> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<List> Login_data() async {
    final response = await http.post("https://eventgo.pmh.web.id/login.php",
        body: {
          'username': usernamecontroller.text,
          'password': passwordcontroller.text
        });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
    } else {
      loginUser();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Dashboard_c(login: true,);
      }));
    }
  }

   bool isLoggedIn = false;

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isloggedin', true);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        formtext("Username", usernamecontroller, false),
        formtext("Password", passwordcontroller, true),
        Container(
          margin: EdgeInsets.only(top: 25),
        ),
        SizedBox(
          width: double.infinity,
          child: FlatButton(
            child: Text("Sign In",
                style: TextStyle(
                    fontFamily: 'frenchcanon',
                    fontSize: 30,
                    color: Colors.black)),
            color: Colors.grey[200],
            onPressed: () {
              Login_data();
            },
          ),
        )
      ],
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

