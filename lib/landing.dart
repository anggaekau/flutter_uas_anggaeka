import 'dart:convert';
import 'package:anggaekau_17630591_uas_flutter/AdminPage.dart';
import 'package:anggaekau_17630591_uas_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Detail.dart';
import 'AddData.dart';

class landing extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<landing> {
// ini method yg kita gunakan untuk mengambil data dari server
  Future<List> getData() async {
    final response =
        await http.get("https://finalflutter.000webhostapp.com/getKoneksi.php");
    return json.decode(response.body); // hanya body yang di ambil
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Data Mahasiswa"),
          backgroundColor: Colors.cyan,
        ),

        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () => Navigator.of(context).push(
        //     new MaterialPageRoute(
        //       builder: (BuildContext context) => new AddData(),
        //     ),
        //   ),
        //   label: Text('Tambah Data'),
        //   icon: Icon(Icons.group_add),
        //   backgroundColor: Colors.cyan,
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 555.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton.extended(
                onPressed: () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddData(),
                )),
                label: Text('Tambah Data'),
                icon: Icon(Icons.group_add),
                backgroundColor: Colors.cyan,
              ),
              // FloatingActionButton.extended(
              //   onPressed: () =>
              //       Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (BuildContext context) => new AddData(),
              //   )),
              //   label: Text('Logout'),
              //   icon: Icon(Icons.group_add),
              //   backgroundColor: Colors.cyan,
              // ),
            ],
          ),
        ),

        body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
    // new Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: new Card(
    //       color: Colors.white,
    //     ));
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  Widget build(BuildContext context) {
    return new ListView.builder(
        padding: new EdgeInsets.only(top: 60.0), //mengatur jarak dari appbar
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Detail(
                        list: list,
                        index: i,
                      ))),
              child: new Card(
                color: Colors.white,
                child: new ListTile(
                  title: new Text("NAMA : ${list[i]['nama']}"),
                  leading: new Icon(
                    Icons.local_library,
                    color: Colors.cyan,
                  ),
                  subtitle: new Text("NPM : ${list[i]['npm']}"),
                ),
              ),
            ),
          );
        });
  }
}
// coding By anggaeka17630591
