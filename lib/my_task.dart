import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTask extends StatelessWidget{
  static const String routeName = '/mytask';
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
        title: Text('My Task',
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
                
          Text("  OnGoing",style: TextStyle(fontSize: 25, color: Color(0xFF323943))),
          SizedBox(height: 15.0),
          Card(
           shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ), 
        child: Container(

           // color: Color(0xFF323943),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Color(0xFF323943)),
            width: MediaQuery.of(context).size.width,
              height: 120,
            child: 
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Mobile Lanjut", style: TextStyle(fontSize: 18, color: Colors.white)),
                SizedBox(height:10),
                Text("Pembuatan Mockup", style: TextStyle(fontSize: 20, color: Color(0xFFF7AF39))),
                SizedBox(height:10),
                Container(
                  child: Text("6 hours left", style: TextStyle(fontSize: 15,color: Colors.white)),
                  alignment: Alignment.bottomRight,
                ),
                
              ],
            ),
            ),
            
          ),
        
        
      ),
      SizedBox(height: 15.0),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)), color: Color(0xFF323943)),
              child: 
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("  Finished",style: TextStyle(fontSize: 25, color: Color(0xFFF7AF39))),
                  ),
                  
                  SizedBox(height: 15.0),
          Card(
           shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ), 
        child: Container(

           // color: Color(0xFF323943),
            //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Color(0xFF323943)),
            width: MediaQuery.of(context).size.width,
              height: 120,
            child: 
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Bahasa Indonesia", style: TextStyle(fontSize: 18, color: Color(0xFF323943))),
                SizedBox(height:10),
                Text("Kalimat Efektif", style: TextStyle(fontSize: 20, color: Color(0xFFF7AF39))),
                SizedBox(height:10)
                
              ],
            ),
            ),
            
          ),
        
        
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