import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:zonapelajar/add_schedule.dart';
import 'package:zonapelajar/bottom_bar.dart';

void main() => runApp(new MaterialApp(
  home: new Add(),
  debugShowCheckedModeBanner: false,
));

class Add extends StatefulWidget {
  @override
  _AddState createState() => new _AddState();
}

class _AddState extends State<Add> {
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
                    Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new AddSchedule();
            }));
          },
          child: Container(
            width: MediaQuery.of(context).size.width/2 - 30.0,
              height: MediaQuery.of(context).size.width/2,
            child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.access_time, size: 70.0,color: Color(0xFFF7AF39)),
                SizedBox(height:10),
                Text("Add Schedule", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
      Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.of(context).pushNamed('/addtask');
          },
          child: Container(
            width: MediaQuery.of(context).size.width/2 - 30.0,
              height: MediaQuery.of(context).size.width/2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.format_list_numbered, size: 70.0,color: Color(0xFFF7AF39)),
                SizedBox(height:10),
                Text("Add Task", style: TextStyle(fontSize: 20)),
              ],
            ),
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
