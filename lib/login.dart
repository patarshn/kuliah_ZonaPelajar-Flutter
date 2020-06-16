import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'register.dart';

void main() => runApp(new MaterialApp(
  home: new Login(),
  debugShowCheckedModeBanner: false,
));

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
 String email, password;
 final _key = new GlobalKey<FormState>();

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
   final response = await http.post("https://panel.serarinne.my.id/zonapelajar/login.php",
       body: {"email": email, "password": password});
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 50,57,67),
              alignment: Alignment.center,
              child:Column(
                children: <Widget>[
                  Image.asset('assets/waifu.png', width: 200.0, height: 200.0,),
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)
                      )
                    ),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _key,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert email";
                                  }
                                },
                                onSaved: (e) => email = e,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                ),
                              ),
                              TextFormField(
                                obscureText: _secureText,
                                onSaved: (e) => password = e,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: Icon(_secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  check();
                                },
                                child: Text("Login"),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                        return new Register();
                                  }));
                                },
                                child: Text("Daftar"),
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