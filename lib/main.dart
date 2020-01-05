import 'package:calcumagique/store/calc.dart';
import 'package:calcumagique/views/calc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CalcStore calcStore = CalcStore();
  await SharedPreferences.getInstance().then((prefs) {
    calcStore.setResults(prefs.getStringList('results') ?? ['724.6284258', '9626882.326', '0.000654715']);
  });

  runApp(MyApp(calcStore));
} 

class MyApp extends StatelessWidget {
  const MyApp(this.calcStore);
  final CalcStore calcStore;

  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [Inject<CalcStore>(() => calcStore)],
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculatrice',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: CalcView()
      ),
    );
  }
}