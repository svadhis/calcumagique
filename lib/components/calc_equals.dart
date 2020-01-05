import 'package:calcumagique/store/calc.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CalcEquals extends StatelessWidget {
  CalcEquals({Key key}) : super(key: key);

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
            '=', 
            style: TextStyle(
              fontSize: 36, 
              color: Colors.deepOrange
            ),
          ),
          Container(
            height: 95,
            width: 95,
            child: Row(
              children: <Widget>[
                Flexible(
                 child: Container(
                   child: Column(
                     children: <Widget>[
                       Flexible(
                        child: GestureDetector(
                          onTap: () => calcStore.setState((state) => state.result(0)),
                          child: Container(
                            color: Colors.green.withOpacity(0)
                          )
                        )
                      ),
                       Flexible(
                        child: GestureDetector(
                          onTap: () => calcStore.setState((state) => state.result(1)),
                          child: Container(
                            color: Colors.pink.withOpacity(0)
                          )
                        )
                      )
                     ],
                   ),
                 )
               ),
                Flexible(
                 child: Container(
                   child: Column(
                     children: <Widget>[
                       Flexible(
                        child: GestureDetector(
                          onTap: () => calcStore.setState((state) => state.result(2)),
                          child: Container(
                            color: Colors.blue.withOpacity(0)
                          )
                        )
                      ),
                       Flexible(
                        child: GestureDetector(
                          onTap: () => calcStore.setState((state) => state.result(3)),
                          child: Container(
                            color: Colors.red.withOpacity(0)
                          )
                        )
                      )
                     ],
                   ),
                 )
               ),
              ],
            ),
          )
        ]
      ),
    );      
  }
}