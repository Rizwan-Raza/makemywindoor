// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makemywindoor/firebase_options.dart';
import 'package:makemywindoor/model/user.dart';
import 'package:makemywindoor/screens/auth/login.dart';
import 'package:makemywindoor/screens/dashboard.dart';
import 'package:makemywindoor/services/timer.dart';
import 'package:makemywindoor/services/user_service.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    Provider(create: (_) => UserServices()),
    ChangeNotifierProvider(create: (context) => TimerService()),
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
              // primarySwatch: const MaterialColor(
              //   0xFFFCB21F,
              //   <int, Color>{
              //     50: Color(0xFFFCB21F),
              //     100: Color(0xFFFCB21F),
              //     200: Color(0xFFFCB21F),
              //     300: Color(0xFFFCB21F),
              //     400: Color(0xFFFCB21F),
              //     500: Color(0xFFFCB21F),
              //     600: Color(0xFFFCB21F),
              //     700: Color(0xFFFCB21F),
              //     800: Color(0xFFFCB21F),
              //     900: Color(0xFFFCB21F),
              //   },
              // ),
              bottomAppBarColor: const Color(0xFFFCB21F),
              colorScheme: const ColorScheme.light(
                  onBackground: Color(0xFFFCB21F),
                  primary: Color(0xFFFCB21F),
                  onPrimary: Colors.black),
              fontFamily: GoogleFonts.inter().fontFamily,
              primaryColor: Colors.black,
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.dark),
              iconTheme: const IconThemeData(color: Colors.white),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: FutureBuilder(
              future: Provider.of<UserServices>(context).getState(),
              builder: (context, AsyncSnapshot<User> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    backgroundColor: Colors.amber,
                    body: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data.phone != null) {
                  return const DashboardScreen();
                } else {
                  return const LoginScreen();
                }
              },
            ),
          );
        });
      },
    );
  }
}
