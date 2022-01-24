import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/helperwidgets/my_button.dart';
import 'package:makemywindoor/helperwidgets/my_textfield.dart';
import 'package:makemywindoor/model/user.dart';
import 'package:makemywindoor/screens/auth/login.dart';
import 'package:makemywindoor/screens/auth/otp.dart';
import 'package:makemywindoor/services/user_service.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  final String? number;
  const SignupScreen({Key? key, this.number}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final User newUser = User.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            children: <Widget>[
              getClipPath(WaveClipper2(), Colors.amber[50], Column()),
              getClipPath(WaveClipper3(), Colors.amber[100], Column()),
              getClipPath(
                  WaveClipper1(),
                  Theme.of(context).colorScheme.primary,
                  const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 24.0),
                      child: Text(
                        "Create an Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  MyTextFormField(
                      label: "Name",
                      icon: LineIcons.user,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (x) => newUser.name = x!),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                      label: "Company Name",
                      icon: LineIcons.building,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your company name';
                        }
                        return null;
                      },
                      onSaved: (x) => newUser.company = x),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                      label: "Email",
                      icon: LineIcons.envelope,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (x) => newUser.email = x!),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                      label: "Phone Number",
                      icon: LineIcons.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (value.length != 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      onSaved: (x) => newUser.phone = x!,
                      initialValue: widget.number),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: MyButton(
              title: "CREATE",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  UserServices us =
                      Provider.of<UserServices>(context, listen: false);
                  us.createUser(newUser.toMap());
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
    );
  }

  ClipPath getClipPath(
      CustomClipper<Path> clipper, Color? color, Widget child) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        child: child,
        width: double.infinity,
        height: SizeConfig.blockSizeVertical * 27,
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
