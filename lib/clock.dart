
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class clock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClockState();
}

class ClockState extends State<clock> {

  String value = "Time here";
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), onTimer);
  }


  void onTimer(Timer timer){
    var now = DateTime.now();
    var formatter = DateFormat("hh:mm:ss");
    String formatted = formatter.format(now);
    setState(() {
      value = formatted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(value, style: TextStyle(color: Colors.green, fontSize: 40),);
  }
}
