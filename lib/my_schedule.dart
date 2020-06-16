import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';

void main() => runApp(new MaterialApp(
  home: new Task(),
  debugShowCheckedModeBanner: false,
));

class Task extends StatefulWidget {
  @override
  _TaskState createState() => new _TaskState();
}

class _TaskState extends State<Task> {
  final dateTime = DateTime.now();
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      appBar: AppBar(title: Text("My Schedule", style: TextStyle(color: Colors.black),), backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                ),
                child: Text("Monday", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50,57,67),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                ),
                child: Text("Tuesday", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                ),
                child: Text("Wednesday", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50,57,67),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                ),
                child: Text("Thursday", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                ),
                child: Text("Friday", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
      child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Person'),
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.amber[800],
    ),
          ),
    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ),
    );
  }
}
