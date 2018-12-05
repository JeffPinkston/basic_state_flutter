import 'package:flutter/material.dart';
import 'src/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();
}


class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _counter;
  bool _checked;

  @override
  void initState() {
    super.initState();
    _counter = _counter ?? 0;
  }

  void _incrementCounter(_) {
    setState(() {
      _counter++;
      print('increment: $_counter');
    });
  }

  void _decrementCounter(_) {
    setState(() {
      _counter--;
      print('decrement: $_counter');
    });
  }

  void _popUpSelection(Commands choice) {
//    switch(choice) {
//      case Commands.loginWithAccount:
//        setState(() {_checked = !_checked;});
//        break;
//      default:
//    }
    print(choice);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(
        title: 'Flutter Demo Home Page',
        counter: _counter,
        checked: _checked,
        popUpSelection: _popUpSelection,
        decrementCounter: _decrementCounter,
        incrementCounter: _incrementCounter,

      ),
    );
  }
}