


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/code/GlobalState.dart';

class ThirdPage extends StatefulWidget{
  @override
  ThirdPageState createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("thirdpage"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(GlobalState.instance.get("name")),
              Text("third page"),
              ElevatedButton(
                  onPressed: (){
                    if(Navigator.of(context).canPop()){
                      Navigator.of(context).pop();
                    }
                    else{
                      Navigator.of(context).pushNamed("/second");
                    }
                  },
                  child: Text("back")
              )
            ],
          ),
        ),
      ),
    );
  }
}