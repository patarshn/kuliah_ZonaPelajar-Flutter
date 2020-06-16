import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'add.dart';

void main() => runApp(new MaterialApp(
  home: new MySch(),
  debugShowCheckedModeBanner: false,
));

class MySch extends StatefulWidget {
  @override
  _MySchState createState() => new _MySchState();
}

class _MySchState extends State<MySch> {
  final dateTime = DateTime.now();
  
  Future<Null> getData() async {
    final sen = await http.get(usenin);
    final rsen = json.decode(sen.body);

    setState(() {
      for (Map dsen in rsen) {
        _senin.add(Senin.fromJson(dsen));
      }
    });

    final sel = await http.get(uselasa);
    final rsel = json.decode(sel.body);

    setState(() {
      for (Map dsel in rsel) {
        _selasa.add(Selasa.fromJson(dsel));
      }
    });

    final rab = await http.get(urabu);
    final rrab = json.decode(rab.body);

    setState(() {
      for (Map drab in rrab) {
        _rabu.add(Rabu.fromJson(drab));
      }
    });

    final kam = await http.get(ukamis);
    final rkam = json.decode(kam.body);

    setState(() {
      for (Map dkam in rkam) {
        _kamis.add(Kamis.fromJson(dkam));
      }
    });

    final jum = await http.get(ujumat);
    final rjum = json.decode(jum.body);

    setState(() {
      for (Map djum in rjum) {
        _jumat.add(Jumat.fromJson(djum));
      }
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
                height: 100.0,
                alignment: Alignment.centerLeft,
  child: ListView.builder(
    scrollDirection: Axis.vertical,
        itemCount: _senin == null ? 0 : _senin.length,
        itemBuilder: (BuildContext context, int index){
          return new Table(
            border: TableBorder.all(color: Colors.white),
                columnWidths: {0: FractionColumnWidth(.2), 1: FractionColumnWidth(.5), 2: FractionColumnWidth(.2)},
                children: [
                  TableRow( children: [
                    Column(children:[
                      new Text(_senin[index].jam, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_senin[index].nama, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_senin[index].ruang, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                  ]),
                ],
          );
        },
      ),
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
                height: 100.0,
                alignment: Alignment.centerLeft,
  child: ListView.builder(
    scrollDirection: Axis.vertical,
        itemCount: _selasa == null ? 0 : _selasa.length,
        itemBuilder: (BuildContext context, int index){
          return new Table(
            border: TableBorder.all(color: Colors.white),
                columnWidths: {0: FractionColumnWidth(.2), 1: FractionColumnWidth(.5), 2: FractionColumnWidth(.2)},
                children: [
                  TableRow( children: [
                    Column(children:[
                      new Text(_selasa[index].jam, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_selasa[index].nama, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_selasa[index].ruang, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                  ]),
                ],
          );
        },
      ),
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
                height: 100.0,
                alignment: Alignment.centerLeft,
  child: ListView.builder(
    scrollDirection: Axis.vertical,
        itemCount: _rabu == null ? 0 : _rabu.length,
        itemBuilder: (BuildContext context, int index){
          return new Table(
            border: TableBorder.all(color: Colors.white),
                columnWidths: {0: FractionColumnWidth(.2), 1: FractionColumnWidth(.5), 2: FractionColumnWidth(.2)},
                children: [
                  TableRow( children: [
                    Column(children:[
                      new Text(_rabu[index].jam, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_rabu[index].nama, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_rabu[index].ruang, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                  ]),
                ],
          );
        },
      ),
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
                height: 100.0,
                alignment: Alignment.centerLeft,
  child: ListView.builder(
    scrollDirection: Axis.vertical,
        itemCount: _kamis == null ? 0 : _kamis.length,
        itemBuilder: (BuildContext context, int index){
          return new Table(
            border: TableBorder.all(color: Colors.white),
                columnWidths: {0: FractionColumnWidth(.2), 1: FractionColumnWidth(.5), 2: FractionColumnWidth(.2)},
                children: [
                  TableRow( children: [
                    Column(children:[
                      new Text(_kamis[index].jam, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_kamis[index].nama, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_kamis[index].ruang, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                  ]),
                ],
          );
        },
      ),
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
              Container(
                height: 100.0,
                alignment: Alignment.centerLeft,
  child: ListView.builder(
    scrollDirection: Axis.vertical,
        itemCount: _jumat == null ? 0 : _jumat.length,
        itemBuilder: (BuildContext context, int index){
          return new Table(
            border: TableBorder.all(color: Colors.white),
                columnWidths: {0: FractionColumnWidth(.2), 1: FractionColumnWidth(.5), 2: FractionColumnWidth(.2)},
                children: [
                  TableRow( children: [
                    Column(children:[
                      new Text(_jumat[index].jam, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_jumat[index].nama, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                    Column(children:[
                      new Text(_jumat[index].ruang, textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ]),
                  ]),
                ],
          );
        },
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


List<Senin> _senin = [];

final String usenin = 'https://panel.serarinne.my.id/zonapelajar/senin.php';
class Senin {
  final String nama, jam, ruang;

  Senin({this.nama, this.jam, this.ruang});

  factory Senin.fromJson(Map<String, dynamic> json) {
    return new Senin(
      nama: json['nama'],
      jam: json['jam'],
      ruang: json['ruang'],
    );
  }
}

List<Selasa> _selasa = [];

final String uselasa = 'https://panel.serarinne.my.id/zonapelajar/selasa.php';
class Selasa {
  final String nama, jam, ruang;

  Selasa({this.nama, this.jam, this.ruang});

  factory Selasa.fromJson(Map<String, dynamic> json) {
    return new Selasa(
      nama: json['nama'],
      jam: json['jam'],
      ruang: json['ruang'],
    );
  }
}

List<Rabu> _rabu = [];

final String urabu = 'https://panel.serarinne.my.id/zonapelajar/rabu.php';
class Rabu {
  final String nama, jam, ruang;

  Rabu({this.nama, this.jam, this.ruang});

  factory Rabu.fromJson(Map<String, dynamic> json) {
    return new Rabu(
      nama: json['nama'],
      jam: json['jam'],
      ruang: json['ruang'],
    );
  }
}

List<Kamis> _kamis = [];

final String ukamis = 'https://panel.serarinne.my.id/zonapelajar/kamis.php';
class Kamis {
  final String nama, jam, ruang;

  Kamis({this.nama, this.jam, this.ruang});

  factory Kamis.fromJson(Map<String, dynamic> json) {
    return new Kamis(
      nama: json['nama'],
      jam: json['jam'],
      ruang: json['ruang'],
    );
  }
}

List<Jumat> _jumat = [];

final String ujumat = 'https://panel.serarinne.my.id/zonapelajar/jumat.php';
class Jumat {
  final String nama, jam, ruang;

  Jumat({this.nama, this.jam, this.ruang});

  factory Jumat.fromJson(Map<String, dynamic> json) {
    return new Jumat(
      nama: json['nama'],
      jam: json['jam'],
      ruang: json['ruang'],
    );
  }
}