import 'package:flutter/material.dart';
import 'package:makemywindoor/screens/dashboard.dart';
import 'package:makemywindoor/screens/login.dart';
import 'package:makemywindoor/screens/signup.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

//sarfaraz
//2nd push comment
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const DashboardScreen(),
    );
  }
}
