import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final int lines;
  const MyTextFormField(
      {Key? key,
      required this.label,
      required this.icon,
      this.validator,
      this.onSaved,
      this.lines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 2.0,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Container(
            height: lines != 1 ? 100 : 48,
            color: Colors.transparent,
          ),
        ),
        TextFormField(
          cursorColor: Colors.amber[700],
          maxLines: lines,
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
          onSaved: onSaved,
          decoration: InputDecoration(
              hintText: label,
              fillColor: Colors.transparent,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  widthFactor: 1.0,
                  heightFactor: lines * 1.0,
                  child: Icon(
                    icon,
                    // color: Colors.amber,
                  ),
                ),
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ],
    );
  }
}
