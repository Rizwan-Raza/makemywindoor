import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final int lines;
  final String? defaultValue;
  final TextInputType? keyboardType;
  const MyTextFormField(
      {Key? key,
      required this.label,
      required this.icon,
      this.validator,
      this.onSaved,
      this.lines = 1,
      this.defaultValue,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 2.0,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(
            height: lines != 1 ? 100 : 48,
            color: Colors.transparent,
          ),
        ),
        TextFormField(
          cursorColor: Colors.amber[700],
          maxLines: lines,
          initialValue: defaultValue,
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
          onSaved: onSaved,
          keyboardType: keyboardType,
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
