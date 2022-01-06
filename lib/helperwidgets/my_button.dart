import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtonHelperWidget extends StatelessWidget {
  final titleX, widthx, heightX, colorx, radiusX;
  final Function onPressedFunction;
  MyButtonHelperWidget(
      {this.titleX,
      required this.onPressedFunction,
      this.widthx,
      this.heightX,
      this.colorx,
      this.radiusX});

  @override
  Widget build(context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusX),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(widthx, heightX)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          onPressedFunction();
        },
        child: Text(titleX,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 16),
            )));
  }
}
