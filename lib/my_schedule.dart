import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MySchedule extends StatelessWidget{
  static const String routeName = '/myschedule';
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {},
        ),
        title: Text('My Schedule',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {
              SystemNavigator.pop();
              },
          ),
        ],
      ),
    body: Text("Hello World"),
    );
      
  }
}