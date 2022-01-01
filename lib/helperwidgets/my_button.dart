// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final titleX, widthx, heightX, colorx, radiusX;
  final Function onPressedFunction;

  MyButton(
      {this.titleX,
      required this.onPressedFunction,
      this.widthx,
      this.heightX,
      this.colorx,
      this.radiusX});

  @override
  Widget build(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(widthx, heightX),
            primary: colorx,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusX)),
            onSurface: colorx),
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
