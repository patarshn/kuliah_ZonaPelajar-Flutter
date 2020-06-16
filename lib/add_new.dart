import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNew extends StatelessWidget{
  static const String routeName = '/addnew';
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Color(0xFF323943),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {},
        ),
        title: Text('Add New',
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
    body: Column(
            mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:20.0,right: 20.0,top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.0),
                /*new RichText(
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
          SizedBox(height: 15.0),*/
          Image.asset("assets/illustration_addnew.png", width: 200),
          SizedBox(height: 15.0),
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
            Navigator.of(context).pushNamed('/addschedule');
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
      ),Card(
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
                ],  
              ),
              
            ),
          
          ),
        ],
      ),
    );
      
  }
}