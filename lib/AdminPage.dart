import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Detail.dart';
import 'AddData.dart';

class AdminPage extends StatelessWidget {
  AdminPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Admin"),
      ),
      // coding By anggaeka17630591
      body: Column(
        children: <Widget>[
          Text(
            'Hallo $username',
            style: TextStyle(fontSize: 20.0),
          ),
          RaisedButton(
            child: Text("LogOUt"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MyHomePage');
            },
          ),
        ],
      ),
    );
  }
}
