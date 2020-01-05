import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalcStore {

  String operation;

  String current = '0';

  String history = '';

  List<String> results = [];

  bool animate = false;

  int currentResult = 0;

  bool justSet = true;

  DateTime test = DateTime.now();

  void write(String content, String type) {
    current = (justSet == true && (type == 'chiffre' || content == '√')) ? content : content == '√' ? content + current : current + content;
    if (justSet == true && type == 'chiffre') history = '';
    justSet = false;
  }

  void resultIterated() {
    history = history + '\n' + current;
    current = currentResult < results.length ? results[currentResult] : '3.18632874135';
    currentResult++;
  }

  void result(int i) {
    justSet = true;
    history = history + '\n' + current;
    current = current == '3+3+3' ? '9' : (i == 3 || results.length == 0 || results[i] == '') ? '3.18632874135' : results[i];
  }

  void back() => current = current.substring(0, current.length - 1);

  void reset() {
    justSet = true;
    current = '0';
    history = '';
  } 

  void setResults(List<String> newResults) async {
    await SharedPreferences.getInstance().then((prefs) async {
      await prefs.setStringList('results', newResults);
      results = newResults;
    });
  }

  void tilt(bool value) {
    reset();
    animate = value;
  }

}