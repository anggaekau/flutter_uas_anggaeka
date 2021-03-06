import 'dart:async';
import 'dart:convert';

import 'package:anggaekau_17630591_uas_flutter/landing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MemberPage.dart';

// coding By anggaeka17630591
void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login ',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/landing': (BuildContext context) => new landing(),
        '/MemberPage': (BuildContext context) => new MemberPage(
              username: username,
            ),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
// coding By anggaeka17630591
  String msg = '';

  Future<List> _login() async {
    final response = await http
        .post("https://finalflutter.000webhostapp.com/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/landing');
      } else if (datauser[0]['level'] == 'member') {
        Navigator.pushReplacementNamed(context, '/MemberPage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }

// coding By anggaeka17630591
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistem Informasi Mahasiswa"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 80.0)),
                new Text('Login',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.cyan,
                    )),
              ],
            ),
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 30.0)),
                new TextField(
                    controller: user,
                    decoration: new InputDecoration(
                        hintText: "Input Username",
                        labelText: "Username",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: pass,
                    decoration: new InputDecoration(
                        hintText: "Input Password",
                        labelText: "Password",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text("Login"),
                  color: Colors.cyan,
                  onPressed: () {
                    _login();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new MyApp()));
                  },
                )
              ],
            ),
            new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(50.0),
                ),
                new Text(
                  'Build By.Angga eka utama 17630591',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 13,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
