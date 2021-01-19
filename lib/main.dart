import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Seja bem vinda!";

  void _changePeople(int deltaPeople) {
    setState(() {
      _people += deltaPeople;

      if (_people < 0) {
        _people = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "Images/restaurant.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white)),
                  onPressed: () {
                    _changePeople(1);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white)),
                  onPressed: () {
                    _changePeople(-1);
                  },
                ),
              ),
            ],
          ),
          Text(_infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic)),
        ],
      )
    ]);
  }
}
