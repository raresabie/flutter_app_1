import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myWidget extends StatelessWidget {

  void onButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed("/home");
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("clik to navigate"),
              ElevatedButton(
                  onPressed: () => onButtonPressed(context),
                  child: Text("click me toia"))
            ],
          ),
        )
    );
  }

}