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
      appBar: AppBar(title: Text("My Task", style: TextStyle(color: Colors.black),), backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Ongoing", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    ),

                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50,57,67),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Finished", textAlign: TextAlign.left, style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold, fontSize: 20.0),),
                    ),
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
