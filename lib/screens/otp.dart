import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makemywindoor/screens/dashboard.dart';
import 'package:makemywindoor/services/http.dart';
import 'package:makemywindoor/services/timer.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:provider/provider.dart';

final inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: BorderSide(color: Colors.grey.shade400),
);

final inputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
  border: inputBorder,
  focusedBorder: inputBorder,
  enabledBorder: inputBorder,
);

bool resend = false;
bool otpFilled = false;
String filledOTP = "";

class OTPScreen extends StatefulWidget {
  final String number;
  const OTPScreen({Key? key, required this.number}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with TickerProviderStateMixin {
  final HttpServices httpS = HttpServices();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Random random = Random();
    int min = 1000;
    int max = 9999;
    String otp = (min + random.nextInt(max - min)).toString();
    httpS.sendOTP(widget.number, otp);

    context.read<TimerService>().startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            const Text(
              "Please enter the 4-digit OTP",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            OTPFields(callback: (b) {
              setState(() {
                otpFilled = b;
              });
            }),
            const SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Resend OTP in ",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey)),
              Container(
                width: SizeConfig.blockSizeHorizontal * 15,
                alignment: Alignment.center,
                child: Text(
                  "${(context.watch<TimerService>().time / 60).round().toString().padLeft(2, '0')}:${(context.watch<TimerService>().time % 60).toString().padLeft(2, '0')}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ]),
            const SizedBox(height: 10.0),
            TextButton(
              child: const Text(
                "RESEND OTP",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: context.watch<TimerService>().time == 0
                  ? () {
                      context.read<TimerService>().resetTimer(10);
                      context.read<TimerService>().startTimer();
                    }
                  : null,
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: otpFilled
                  ? () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardScreen()),
                          (route) => false);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                minimumSize: const Size(200, 48),
              ),
              child: const Text(
                "CONFIRM",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OTPFields extends StatefulWidget {
  const OTPFields({
    Key? key,
    required this.callback,
  }) : super(key: key);
  final Function callback;

  @override
  _OTPFieldsState createState() => _OTPFieldsState();
}

class _OTPFieldsState extends State<OTPFields> {
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  FocusNode? pin1FN;
  FocusNode? pin2FN;
  FocusNode? pin3FN;
  FocusNode? pin4FN;
  final pinStyle = const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  List<String> otp = List<String>.filled(4, ' ');

  @override
  void initState() {
    super.initState();
    pin1FN = FocusNode();
    pin2FN = FocusNode();
    pin3FN = FocusNode();
    pin4FN = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FN?.dispose();
    pin2FN?.dispose();
    pin3FN?.dispose();
    pin4FN?.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.children.first.requestFocus();
    }
  }

  void eventCheck(RawKeyEvent event, FocusNode fn) {
    if (event.logicalKey == LogicalKeyboardKey.backspace &&
        event.runtimeType.toString() == "RawKeyDownEvent") {
      // here you can check if textfield is focused
      // dev.log('backspace clicked');
      fn.children.first.requestFocus();
      widget.callback(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fKey,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 60,
                child: RawKeyboardListener(
                  onKey: (event) => eventCheck(event, pin1FN!),
                  focusNode: pin1FN!,
                  child: TextFormField(
                    autofocus: true,
                    style: pinStyle,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: inputDecoration,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      nextField(value, pin2FN);
                    },
                    onSaved: (newValue) => otp[0] = newValue!,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: RawKeyboardListener(
                  focusNode: pin2FN!,
                  onKey: (event) => eventCheck(event, pin1FN!),
                  child: TextFormField(
                    // focusNode: ,
                    style: pinStyle,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: inputDecoration,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onSaved: (newValue) => otp[1] = newValue!,
                    onChanged: (value) => nextField(value, pin3FN),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: RawKeyboardListener(
                  focusNode: pin3FN!,
                  onKey: (event) => eventCheck(event, pin2FN!),
                  child: TextFormField(
                    // focusNode: pin3FN,
                    style: pinStyle,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: inputDecoration,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onSaved: (newValue) => otp[2] = newValue!,
                    onChanged: (value) => nextField(value, pin4FN),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: RawKeyboardListener(
                  focusNode: pin4FN!,
                  onKey: (event) => eventCheck(event, pin3FN!),
                  child: TextFormField(
                    style: pinStyle,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: inputDecoration,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onSaved: (newValue) => otp[3] = newValue!,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4FN!.unfocus();
                        _fKey.currentState!.save();
                        filledOTP = otp.join("");
                        dev.log(filledOTP);
                        widget.callback(true);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
