import 'package:calcumagique/store/calc.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CalcKey extends StatelessWidget {
  CalcKey(this.type, this.value, {Key key}) : super(key: key);
  final String type;
  final dynamic value;

  @override
  Widget build(BuildContext context) {

    final ReactiveModel<CalcStore> calcStore = Injector.getAsReactive<CalcStore>(context: context);

    return Parent(
      style: ParentStyle()
        ..alignmentContent.center()
        ..height(95)
        ..width(95)
        ..background.color(Colors.transparent)
        ..borderRadius(all:  0),
      gesture: Gestures()
        ..onTap(() => calcStore.setState((state) => 
        value == Icons.backspace ? state.back() : 
        value == 'c' ? state.reset() :
        value == 'x²' ? state.write('²', type) :
        state.write(value.toString(), type))),
      child: value is String ? 
      Text(
        value, 
        style: TextStyle(
          fontSize: value == '%' ? 30 : 36, 
          color: Colors.deepOrange
        ),
      ) : value is IconData ?
      Icon(
        value, 
        color: Colors.deepOrange, 
        size: 28,
      ) : 
      Text(
        value.toString(), 
        style: TextStyle(
          fontSize: 30
        )
      ),
    );
  }
}