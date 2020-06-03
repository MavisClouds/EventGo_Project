import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'v_ep_dashboard.dart';
import 'package:EventGo_Project/CustomWidget/customw.dart';
import 'package:http/http.dart' as http;

class Ep_createevent extends StatelessWidget {
  const Ep_createevent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Style_createevent();
  }

}

//============================================== Create Event Data =============================

class Style_createevent extends StatefulWidget {
  Style_createevent({
    Key key,
  }) : super(key: key);

  @override
  _Style_createeventState createState() => _Style_createeventState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _Style_createeventState extends State<Style_createevent> {
  final _formKey = GlobalKey<FormState>();

  /*static final String uploadEndPoint = 'http://localhost/eventgo/upload_image.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  setStatus(String message)
  {
    setState(() {
      status = message;
    });
  }
  startUpload() {
    if(null == tmpFile) {
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
  }

  upload(String fileName){
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
  }

  Widget showImage(){
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if(snapshot.connectionState == ConnectionState.done &&
        null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
              ),
              );
        } else if (null != snapshot.error) {
          return const Text(
            'Error picking image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      }
    );
  }*/

  String initvalue;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  TextEditingController startdatecontroller = TextEditingController();
  TextEditingController enddatecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();

  String dropdownValue = 'Category';

  _Style_createeventState();

  Future<void> Adddata() async {
    var url = "https://eventgo.pmh.web.id/adddataevent.php";
    //var url = "http://localhost/eventgo/adddataevent.php";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String idaccount = prefs.getString('idaccount');
    print(idaccount);
    http.post(url, body: {
      "nama_event": titlecontroller.text,
      "deskripsi_event": desccontroller.text,
      "tanggal_mulai": startdatecontroller.text,
      "tanggal_selesai": enddatecontroller.text,
      "lokasi": locationcontroller.text,
      "idacc": idaccount,
      "kategori": dropdownValue
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_right),
          onPressed: () {
            Adddata();
            Navigator.pop(context);
          },
        ),
        body: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                formtext("Event Title", titlecontroller, false,"Title"),
                formtext("Describe Your Event", desccontroller, false,"Description"),
                datetime("Start Date", startdatecontroller),
                datetime("End Date", enddatecontroller),
                Container(margin: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.location_city),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
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
                formtext("Location", locationcontroller, false,"Location"),
                /*OutlineButton(
                  onPressed: chooseImage,
                  child: Text('Choose Image'),
                  ),
                  SizedBox(height: 20.0,),
                  showImage(),
                  SizedBox(height: 20.0,),
                  OutlineButton(
                    onPressed: startUpload,
                    child: Text('Upload Image'),
                    ),
                  SizedBox(height: 20.0,),
                  Text(status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ))*/
              ]),
        ));
  }
}

//======================================== Custom Widget =======================================
