import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final bool min;
  const MyButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.min = false})
      : super(key: key);

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        minimumSize: !min ? const Size(double.infinity, 48) : null,
        // minimumSize: MaterialStateProperty.all(Size(widthx, heightX)),
        // backgroundColor: MaterialStateProperty.all(Colors.transparent),
        // elevation: MaterialStateProperty.all(3),
        // shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            // fontWeight: FontWeight.normal,
            // color: Colors.white,
            fontSize: !min ? 18 : null),
      ),
    );
  }
}
