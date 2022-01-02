import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:makemywindoor/screens/otp.dart';
import 'package:makemywindoor/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String number;
  bool numberError = false;
  bool numberOk = false;
  late String errorString;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 360,
                  color: Colors.amber[50],
                  // decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //         colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 360,
                  color: Colors.amber[100],
                  // decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //         colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Center(
                    child: SizedBox(
                      width: 240,
                      height: 240,
                      child:
                          Lottie.asset("assets/imgs/login.json", reverse: true),
                    ),
                  ),
                  width: double.infinity,
                  height: 360,
                  color: Colors.amber,
                  // decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //         colors: [Colors.amber, Colors.amberAccent])),
                ),
              ),
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
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              color: numberError ? Colors.red.shade50 : null,
              shadowColor: numberError ? Colors.red : null,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  onTap: () {
                    setState(() {
                      numberError = false;
                    });
                  },
                  onChanged: (value) {
                    if (value.length == 10) {
                      setState(() {
                        numberOk = true;
                      });
                    } else if (numberOk) {
                      setState(() {
                        numberOk = false;
                      });
                    }
                    if (numberError) {
                      setState(() {
                        numberError = false;
                      });
                    }
                  },
                  maxLength: 10,
                  onSaved: (newValue) => number = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        numberError = true;
                        numberOk = false;
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   content: Text('Please enter your mobile number'),
                      //   duration: Duration(seconds: 3),
                      // ));
                      errorString = 'Please enter your mobile number';
                      // return 'Please enter your mobile number';
                    } else if (value.length != 10) {
                      setState(() {
                        numberError = true;
                        numberOk = false;
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   content: Text('Please enter valid mobile number'),
                      //   duration: Duration(seconds: 3),
                      // ));
                      errorString = 'Please enter valid mobile number';
                    }
                  },
                  cursorColor: Colors.amber[700],
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      counterText: "",
                      suffixIcon: numberError
                          ? const Icon(
                              Icons.error,
                              color: Colors.red,
                            )
                          : numberOk
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : null,
                      prefixIcon: Material(
                        elevation: 0,
                        color: numberError ? Colors.red.shade50 : null,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.phone,
                          color: numberError ? Colors.red : Colors.black45,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 13)),
                ),
              ),
            ),
          ),
          numberError
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32 + 25, vertical: 8),
                  child: Text(
                    errorString,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                )
              : Container(),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 32),
          //   child: Material(
          //     elevation: 2.0,
          //     borderRadius: const BorderRadius.all(Radius.circular(30)),
          //     child: TextField(
          //       onChanged: (String value) {},
          //       cursorColor: Colors.deepOrange,
          //       decoration: const InputDecoration(
          //           hintText: "Password",
          //           prefixIcon: Material(
          //             elevation: 0,
          //             borderRadius: BorderRadius.all(Radius.circular(30)),
          //             child: Icon(
          //               Icons.lock,
          //               color: Colors.red,
          //             ),
          //           ),
          //           border: InputBorder.none,
          //           contentPadding:
          //               EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                minimumSize: const Size(200, 48),
              ),
              child: const Text(
                "VERIFY",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OTPScreen(
                                number: number,
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
                "Don't have an Account? ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                      (Route<dynamic> route) => false);
                },
                child: const Text(
                  "Sign Up ",
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
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
