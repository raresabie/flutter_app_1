




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget{
  @override
  FourthPageState createState() => FourthPageState();
}

class FourthPageState extends State<FourthPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fourth 4 page "),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text("fourth page"),
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