import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockSizeHorizontal = 0.0;
  static double blockSizeVertical = 0.0;
  static double textMultiplier = 0.0;
  static double heightMultiplier = 0.0;
  static double imageMultiplier = 0.0;

  void init(
    BoxConstraints constraints,
    Orientation orientation,
  ) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
    }

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    heightMultiplier = blockSizeVertical;
    imageMultiplier = blockSizeHorizontal;

    // print(blockSizeHorizontal);
    // print(blockSizeVertical);
  }
}
