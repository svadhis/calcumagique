import 'dart:async';

import 'package:calcumagique/store/calc.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CalcC extends StatelessWidget {
  CalcC({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ReactiveModel<CalcStore> calcStore = Injector.getAsReactive<CalcStore>(context: context);

    return Parent(
      style: ParentStyle()
        ..alignmentContent.center()
        ..height(95)
        ..width(95),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            'c', 
            style: TextStyle(
              fontSize: 36, 
              color: Colors.deepOrange
            ),
          ),
          Column(
          children: <Widget>[
            Container(
              height: 40,
              width: 95,
              child: GestureDetector(
                onTap: () {
                  calcStore.setState((state) => state.reset());
                  Timer(Duration(seconds: 4), () {
                      calcStore.setState((state) => state.tilt(true));
                      Timer(Duration(seconds: 5), () => calcStore.setState((state) => state.tilt(false)));
                    });
                }, 
                child: Container(
                  color: Colors.blue.withOpacity(0)
                )
              )
            ),
            Container(
              height: 55,
              width: 95,
              child: GestureDetector(
                onTap: () => calcStore.setState((state) => state.reset()),
                child: Container(
                  color: Colors.green.withOpacity(0)
                )
              )
            )
          ]
        )
        ]
      ),
    );      
  }
}