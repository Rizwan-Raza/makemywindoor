import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/model/user.dart';
import 'package:makemywindoor/screens/auth/login.dart';
import 'package:makemywindoor/screens/auth/otp.dart';
import 'package:makemywindoor/services/user_service.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final User newUser = User.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  getClipPath(WaveClipper2(), Colors.amber[50], Column()),
                  getClipPath(WaveClipper3(), Colors.amber[100], Column()),
                  getClipPath(
                      WaveClipper1(),
                      Colors.amber,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 24.0),
                        child: Text(
                          "Create an Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "We will send you an "),
                      TextSpan(
                          text: "One Time Password",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " on this mobile number"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    getField("Name", LineIcons.user,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (x) => newUser.name = x),
                    const SizedBox(
                      height: 20,
                    ),
                    getField("Company Name", LineIcons.building,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your company name';
                          }
                          return null;
                        },
                        onSaved: (x) => newUser.company = x),
                    const SizedBox(
                      height: 20,
                    ),
                    getField("Email", LineIcons.envelope,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (x) => newUser.email = x),
                    const SizedBox(
                      height: 20,
                    ),
                    getField("Phone Number", LineIcons.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (value.length != 10) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                        onSaved: (x) => newUser.phone = x),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    minimumSize: const Size(200, 48),
                  ),
                  child: const Text(
                    "CREATE",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      UserServices us =
                          Provider.of<UserServices>(context, listen: false);
                      us.createUser(newUser.toJson());
                      us.login(newUser.phone);
                      us.saveState();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                    number: newUser.phone,
                                  )));
                    }
                  },
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const Center(
              //   child: Text(
              //     "FORGOT PASSWORD ?",
              //     style: TextStyle(
              //         color: Colors.red, fontSize: 12, fontWeight: FontWeight.w700),
              //   ),
              // ),

              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an Account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Text(
                    " instead",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getField(String hText, IconData icon,
      {String? Function(String?)? validate, onSaved}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Stack(
        children: [
          Material(
            elevation: 2.0,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Container(
              height: 48,
              color: Colors.transparent,
            ),
          ),
          TextFormField(
            onChanged: (String value) {},
            cursorColor: Colors.amber[700],
            validator: (value) {
              if (validate != null) {
                return validate(value);
              }
              return null;
            },
            onSaved: onSaved,
            decoration: InputDecoration(
                hintText: hText,
                fillColor: Colors.transparent,
                prefixIcon: Material(
                  elevation: 0,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Icon(
                    icon,
                    // color: Colors.amber,
                  ),
                ),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
          ),
        ],
      ),
    );
  }

  ClipPath getClipPath(
      CustomClipper<Path> clipper, Color? color, Widget child) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        child: child,
        width: double.infinity,
        height: SizeConfig.blockSizeVertical * 20,
        color: color,
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
