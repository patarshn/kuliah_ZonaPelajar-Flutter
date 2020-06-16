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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text("My Task", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:15.0, right:15.0),
            child: Icon(Icons.edit),
          ),
          Padding(
            padding: EdgeInsets.only(right:15.0),
            child: Icon(Icons.delete),
          ),
        ],
        ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Mobile Lanjut", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                          Text("Tuesday, March 10th 2020", textAlign: TextAlign.left, style: TextStyle( fontSize: 15.0),),
                          Text("16.00", textAlign: TextAlign.left, style: TextStyle( fontSize: 15.0),),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                      child: Text("Pembuatan Mockup", textAlign: TextAlign.left, style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold, fontSize: 15.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Description", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 15.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 15.0),),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.orange,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                      child: Text(
                        "Mark as Finished",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
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
