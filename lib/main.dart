import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:zonapelajar/bottom_bar.dart';
import 'package:zonapelajar/login.dart';
import 'package:zonapelajar/my_schedule.dart';
import 'package:zonapelajar/my_task.dart';
import 'package:zonapelajar/add_new.dart';
import 'package:zonapelajar/register.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: <String, WidgetBuilder>{
      '/myschedule' : (BuildContext context) => new MySchedule(),
      '/mytask' : (BuildContext context) => new MyTask(),
      '/addnew' : (BuildContext context) => new AddNew(),
      '/home' : (BuildContext context) => new MyHomePage(),
    },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3,vsync: this);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF323943),
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: (){},
        ),
        title: Text('Home',
        style: TextStyle(fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: (){},
          ),
        ],
      ),*/
      body: Column(
            mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:20.0,right: 20.0,top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.0),
                new RichText(
                  text: new TextSpan(
                    style: new TextStyle(fontFamily: 'Velera', fontSize: 38.0,fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      new TextSpan(text: 'Welcome '),
                      new TextSpan(text: 'Yosua!', style: new TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF7AF39)),),
                    ],
                  ),
                ),
          SizedBox(height: 15.0),
          new RichText(
                  text: new TextSpan(
                    style: new TextStyle(fontFamily: 'Velera', fontSize: 26.0,fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      new TextSpan(text: "It's "),
                      new TextSpan(text: 'Tuesday ', style: new TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF7AF39)),),
                      new TextSpan(text: '07:30'),
                    ],
                  ),
                ),
          SizedBox(height: 15.0),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text('07.30',
                style: TextStyle(fontFamily: 'Varela', fontSize: 21.0)
                ),
              ),

              Tab(
                child: Text('Hello World 2',
                style: TextStyle(fontFamily: 'Varela', fontSize: 21.0)
                ),
              ),

              Tab(
                child: Text('Hello World 3',
                style: TextStyle(fontFamily: 'Varela', fontSize: 21.0)
                ),
              ),
            ],
          ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)), color: Colors.white),
              child: 
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
                children: <Widget>[
                  Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.of(context).pushNamed('/myschedule');
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
      ),Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.of(context).pushNamed('/mytask');
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
                ],  
              ),
              
            ),
          
          ),
        ],
      ),
      
     floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/addnew');
      },
      backgroundColor: Color(0xFFF7AF39),
      child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
