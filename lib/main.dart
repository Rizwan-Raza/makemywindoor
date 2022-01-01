// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makemywindoor/screens/login.dart';
import 'package:makemywindoor/utils/size_config.dart';

void main() {
  runApp(const App());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // statusBarColor:    ColorCodeGen.colorFromHex('#342794').withOpacity(0.7),
      statusBarColor: Colors.transparent,
    ),
  );
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

//sarfaraz
//2nd push comment
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.amber,

              // primaryColor: Colors.black,
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.dark),
              iconTheme: const IconThemeData(color: Colors.white),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const LoginScreen(),
          );
        });
      },
    );
  }
}
