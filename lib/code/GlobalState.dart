import 'package:flutter/material.dart';


class GlobalState{
  final Map<dynamic, dynamic> data = <dynamic, dynamic>{};

  static GlobalState instance  =  GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => data[key] = value;
  get(dynamic key) => data[key];


}