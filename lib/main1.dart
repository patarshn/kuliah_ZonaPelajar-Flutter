//dari arie
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'register.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
void main() => runApp(new MaterialApp(
  home: new Login(),
  debugShowCheckedModeBanner: false,
));

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
 String hari, nama, ruang, jam = "00:00", _jam = "00:00";
 final _key = new GlobalKey<FormState>();
 void _setJam() {
    setState(() => jam = _jam);
}
 bool _secureText = true;

 showHide() {
   setState(() {
     _secureText = !_secureText;
   });
 }
 check() {
   final form = _key.currentState;
   if (form.validate()) {
     form.save();
     login();
   }
 }
 login() async {
   final response = await http.post("https://panel.serarinne.my.id/zonapelajar/ischedule.php",
       body: {"nama": nama, "ruang": ruang, "jam": jam, "hari": hari});
   String status = response.body;
   if (status == "1") {
     _showDialog("Berhasil Login...");
   } else if (status == "0") {
     _showDialog("Email atau Password Anda Salah....");
   } else {
     _showDialog("Terjadi Kesalahan, Silahkan Ulangi Lagi...");
   }
 }

 void _showDialog (String message) {
    showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  backgroundColor: Colors.deepPurple,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  content: Text(message, style: TextStyle(color: Colors.white),),
                  actions: <Widget>[
                    new FlatButton(
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Close", style: new TextStyle(color: Colors.deepPurple)),
                  ],
                ),
                onPressed: () {
                        Navigator.of(context).pop();
                      },
              ),
                  ],
                );
              }
          );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(title: Text("Add Schedule", style: TextStyle(color: Colors.black),), backgroundColor: Colors.white,),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.all(15.0),
              child:Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _key,
                          child: Column(
                            children: <Widget>[
                              DropDownFormField(
                                titleText: "Select Day",
                                hintText: 'Day',
                                value: hari,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please select day";
                                  }
                                },
                                onSaved: (value) {
                                  setState(() {
                                    hari = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    hari = value;
                                  });
                                },
                                dataSource: [
                                  {
                                    "display": "Monday",
                                    "value": "Monday",
                                  },
                                  {
                                    "display": "Tuesday",
                                    "value": "Tuesday",
                                  },
                                  {
                                    "display": "Wednesday",
                                    "value": "Wednesday",
                                  },
                                  {
                                    "display": "Thursday",
                                    "value": "Thursday",
                                  },
                                  {
                                    "display": "Friday",
                                    "value": "Friday",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                              TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert name";
                                  }
                                },
                                onSaved: (e) => nama = e,
                                decoration: InputDecoration(
                                  labelText: "Course Name",
                                ),
                              ),
                              TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert class";
                                  }
                                },
                                onSaved: (e) => ruang = e,
                                decoration: InputDecoration(
                                  labelText: "Class",
                                ),
                              ),
                              FlatButton(
                onPressed: () {
                  DatePicker.showPicker(context, showTitleActions: true, onChanged: (date) {
                    _jam = date.hour.toString() + ":" + date.minute.toString();
                    _setJam();
                  }, onConfirm: (date) {
                    _jam = date.hour.toString() + ":" + date.minute.toString();
                    _setJam();
                  }, pickerModel: CustomPicker(currentTime: DateTime.now()), locale: LocaleType.id);
                },
                child: Text(
                  'Select Time : $_jam',
                  style: TextStyle(color: Colors.blue),
                )),
                              MaterialButton(
                                onPressed: () {
                                  check();
                                },
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale}) : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
            this.currentLeftIndex(), this.currentMiddleIndex(), this.currentRightIndex())
        : DateTime(currentTime.year, currentTime.month, currentTime.day, this.currentLeftIndex(),
            this.currentMiddleIndex(), this.currentRightIndex());
  }
  
  floatingActionButton: FloatingActionButton(onPressed: () {
                                  check();
                                },,
      backgroundColor: Color(0xFFF7AF39),
      child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
  
}
