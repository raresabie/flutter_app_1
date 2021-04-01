import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/TimeDisplay.dart';
import 'package:intl/intl.dart';

class TimeCounter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TimeCounterState();
}

class TimeCounterState extends State<TimeCounter> {
  Stopwatch _stopwatch;
  Duration _duration;
  Timer _timer;

  void onStarted() {
    setState(() {
      _stopwatch = Stopwatch();
      _timer = Timer.periodic(Duration(milliseconds: 250), onTimeOut);
    });
    _stopwatch.start();
  }

  void onStop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  void onTimeOut(Timer timer) {
    if(!_stopwatch.isRunning){
      return;
    }
    else{
      setState(() {
        _duration = _stopwatch.elapsed;
      });
    }
  }

  void onClear(Duration value) {
    setState(() {
      _duration = Duration();
    });
  }

  @override
  void initState() {
    _duration = Duration();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            TimeDisplay(
              color: Colors.red,
              duration: _duration,
              onClear: onClear,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: onStarted,
                    child: Text("start "),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: onStop,
                    child: Text("stop "),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
