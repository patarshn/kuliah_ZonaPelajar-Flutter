import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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
      appBar: AppBar(
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
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('Welcome, Yosua!',
          style: TextStyle(fontFamily: 'Velera', fontSize: 42.0,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text("It's Tuesday, 07:30",
          style: TextStyle(fontFamily: 'Velera', fontSize: 34.0,fontWeight: FontWeight.bold),
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
    );
  }
}
