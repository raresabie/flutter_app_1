import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/clock.dart';
import 'package:flutter_app_1/code/GlobalState.dart';
import 'package:flutter_app_1/myWidget2.dart';
import 'package:flutter_app_1/screens/SecondPage.dart';

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  TextEditingController name;
  GlobalState store = GlobalState.instance;

  @override
  void initState() {
    name = TextEditingController();
    store.set(name, "");
    name.text = store.get("name");
  }

  void onPressed() {
    store.set("name", name.text);
    //Navigator.of(context).pushNamed("/second");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => SecondPage(
                  name: name.text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
      ),
      body: Container(
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: name,
                        decoration:
                            InputDecoration(labelText: "enrer yout name"),
                      ),
                      ElevatedButton(onPressed: onPressed, child: Text("next")),
                      myWidget2(),
                      clock(),
                      Text("welcome home"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/second", (Route<dynamic> route) => false);
                          },
                          child: Text("next")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/third");
                          },
                          child: Text("to thirs")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/childToParent");
                          },
                          child: Text("to child to parente"))
                    ],
                  ),
                );
              }, childCount: 1)),
            ],
          ),
        ),
      ),
    );
  }
}
