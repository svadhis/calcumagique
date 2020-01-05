import 'package:calcumagique/components/calc_c.dart';
import 'package:calcumagique/components/calc_equals.dart';
import 'package:calcumagique/components/calc_key.dart';
import 'package:calcumagique/store/calc.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CalcView extends StatelessWidget {
  const CalcView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ReactiveModel<CalcStore> calcStore = Injector.getAsReactive<CalcStore>(context: context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        calcStore.state.animate == true ? Container(
          margin: EdgeInsets.only(bottom: 1),
          child: Countdown(
            duration: Duration(seconds: 5),
            onFinish: () {
              print('finished!');
            },
            builder: (_, remaining) {
              return Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    width: 30,
                    height: 0.5,
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[900]),
                      backgroundColor: Colors.black,
                      value: 1 - (remaining.inSeconds * 2 / 10)
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 0.5,
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      backgroundColor: Colors.grey[900],
                      value: remaining.inSeconds * 2 / 10
                    ),
                  )
                ]
              );
            },
          ),
        ) :
       Container(),
        Parent(
          style: ParentStyle()
            ..animate(calcStore.state.animate == false ? 100 : 4500, Curves.easeInOut)
            ..rotate(calcStore.state.animate == false ? 1 : 0.95)
            ..offset(calcStore.state.animate == false ? 0 : 120, calcStore.state.animate == false ? 0 : -30),
          child: Container(
            child: Scaffold(
              appBar: AppBar(
                title: Text('Calculatrice'),
                actions: <Widget>[IconButton(icon: Icon(Icons.more_vert), onPressed: () {},)],
              ),
              drawer: GestureDetector(
                onLongPress: () => calcStore.setState((state) async {

                  TextEditingController inputController = TextEditingController();
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: TextField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: inputController,       
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Valider'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  );

                  TextEditingController inputController2 = TextEditingController();
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: TextField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: inputController2,       
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Valider'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  );

                  TextEditingController inputController3 = TextEditingController();
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: TextField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: inputController3,       
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Valider'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  );

                  state.setResults([inputController.text, inputController2.text, inputController3.text]);
                }),
                child: Drawer()
              ),
              body: Parent(
                style: ParentStyle()
                  ..background.color(Colors.white),
                child: Column(
                  children: <Widget>[
                    Parent(
                      style: ParentStyle()
                        ..background.color(Colors.grey[200])
                        ..alignmentContent.centerRight()
                        ..padding(all: 6)
                        ..height(200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              calcStore.state.history,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              calcStore.state.current,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 42,
                                color: Colors.deepOrange
                              ),
                            ),
                          )
                        ]
                      ),
                    ),
                    Expanded(
                    child: Parent(
                      style: ParentStyle()
                      ..alignmentContent.center(),
                      child: Wrap(
                        children: <Widget>[
                          CalcC(),
                          CalcKey('function', '√'),
                          CalcKey('function', 'x²'),
                          CalcKey('function', '÷'),
                          CalcKey('chiffre', 7),
                          CalcKey('chiffre', 8),
                          CalcKey('chiffre', 9),
                          CalcKey('function', '×'),
                          CalcKey('chiffre', 4),
                          CalcKey('chiffre', 5),
                          CalcKey('chiffre', 6),
                          CalcKey('function', '−'),
                          CalcKey('chiffre', 1),
                          CalcKey('chiffre', 2),
                          CalcKey('chiffre', 3),
                          CalcKey('function', '+'),
                          CalcKey('function', Icons.backspace),
                          CalcKey('chiffre', 0),
                          CalcKey('function', '.'),
                          CalcEquals()
                        ],
                      )
                    )
                  )
                  ],
                ),
              )
            )
          )
        )
      ]
    );
  }
}