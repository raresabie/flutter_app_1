


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/TimeCounter.dart';
import 'package:flutter_app_1/code/GlobalState.dart';
import 'package:flutter_app_1/myWidget.dart';

class SecondPage extends StatefulWidget{

  String name;
  SecondPage({this.name});

  @override
  SecondPageState createState() => SecondPageState(name: name);
}

class SecondPageState extends State<SecondPage>{

  String name;
  SecondPageState({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("secondpage"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text("second page"),
              Text("Global state name : " + GlobalState.instance.get("name")),
              Text("Constructor passed name : " + name),
              ElevatedButton(
                  onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil("/third", (Route<dynamic> route) => false);},
                  child: Text("next")
              ),
              ElevatedButton(
                  onPressed: (){Navigator.of(context).pop();},
                  child: Text("back")
              ),
              myWidget(),
              Text("my Stopwatch"),
              TimeCounter()
            ],
          ),
        ),
      ),
    );
  }
}