// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makemywindoor/screens/login.dart';
import 'package:makemywindoor/services/timer.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TimerService(time: 15)),
  ], child: const App()));

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
              fontFamily: GoogleFonts.inter().fontFamily,
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
