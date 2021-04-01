import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/authenticator.dart';

class ChildToParent19 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChildToParent19State();
}

class ChildToParent19State extends State<ChildToParent19> {
  bool isAuthenticated;

  void onAuthenticated(bool value) {
    setState(() {
      isAuthenticated = value;
    });
  }

  @override
  void initState() {
    isAuthenticated = false;
  }

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
              Authenticator(onAuthenticated: onAuthenticated),
              Text("Authenticated : ${isAuthenticated}")
            ],
          ),
        ),
      ),
    );
  }
}
