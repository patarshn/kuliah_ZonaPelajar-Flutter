import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'my_schedule.dart';
import 'my_task.dart';
import 'add.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
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

  Future<Null> getData() async {
    final dt = await http.get(udata);
    debugPrint(udata);
    print(udata);
    final rsen = json.decode(dt.body);

    setState(() {
      for (Map dsen in rsen) {
        _data.add(Data.fromJson(dsen));
        //print(Data.fromJson(dsen));
      }
      print(_data.length);
    });
}

@override
void initState() {
    super.initState();

    getData();
}
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
                    SizedBox(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) => Card(
            shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_data[index].jam, style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),),
                    Text(_data[index].nama, style: TextStyle(color: Colors.orange, fontSize: 14.0, fontWeight: FontWeight.bold),),
                    Text(_data[index].ruang, style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),),
                  ],
                ),
                ),
              ),
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
                                  return new MySch();
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
                Text("My Schedule", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
      Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.of(context)
                                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                  return new MyTask();
                            }));
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
                Text("My Task", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),

                  ],
                ),
                /*Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(onPressed: (){Navigator.of(context)
                                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                  return new MySch();
                            }));}, 
                    icon: Icon(Icons.access_time), label: Text("My Schedule")),
                    FlatButton.icon(onPressed: (){Navigator.of(context)
                                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                  return new MyTask();
                            }));}, icon: Icon(Icons.list), label: Text("My Task"))
                  ],
                ),*/
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
        onPressed: (){Navigator.of(context)
                                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                  return new Add();
                            }));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ),
    );
  }
}

List<Data> _data = [];

final String udata = 'https://panel.serarinne.my.id/zonapelajar/home.php?hari='+ DateTimeFormat.format(DateTime.now(), format: 'l');


class Data {
  final String nama, jam, ruang;

  Data({this.nama, this.jam, this.ruang});

  factory Data.fromJson(Map<String, dynamic> json) {
    return new Data(
      nama: json['nama'],
      jam: json['jam'],
      ruang: json['ruang'],
    );
  }
}