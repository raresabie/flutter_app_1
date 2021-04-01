import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  Authenticator({this.onAuthenticated});

  final ValueChanged<bool> onAuthenticated;

  @override
  State<StatefulWidget> createState() =>
      AuthenticatorState(onAuthenticated: onAuthenticated);
}

class AuthenticatorState extends State<Authenticator> {
  AuthenticatorState({Key key, this.onAuthenticated});

  void onClick() {
    if (user.text != "user" || password.text != "1234") {
      onAuthenticated(false);
    } else {
      onAuthenticated(true);
    }
  }

  TextEditingController user;
  TextEditingController password;
  final ValueChanged<bool> onAuthenticated;

  @override
  void initState() {
    user = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: user,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: onClick,
                child: Text("Authenticate"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
