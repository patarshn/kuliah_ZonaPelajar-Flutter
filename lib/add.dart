import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:zonapelajar/bottom_bar.dart';

void main() => runApp(new MaterialApp(
  home: new Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final dateTime = DateTime.now();
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 50,57,67),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                color: Color.fromARGB(255, 50,57,67),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0, top: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text("Welcome, ", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),),
                          Text("Yosua", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.orange),),
                          Text("!", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text("It's ", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),),
                          Text(DateTimeFormat.format(dateTime, format: 'l')+", ", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.orange),),
                          Text(DateTimeFormat.format(dateTime, format: 'H:i'), textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(onPressed: null, icon: Icon(Icons.access_time), label: Text("My Schedule")),
                    FlatButton.icon(onPressed: null, icon: Icon(Icons.list), label: Text("My Task"))
                  ],
                ),
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
