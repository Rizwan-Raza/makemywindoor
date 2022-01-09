import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/helperwidgets/my_textfield.dart';

class CustomerDetails extends StatelessWidget {
  final GlobalKey<FormState> detailForm;
  const CustomerDetails({Key? key, required this.detailForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: detailForm,
      child: Column(
        children: [
          MyTextFormField(
              label: "Project Name",
              icon: LineIcons.book,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter project name';
                }
              }),
          const SizedBox(
            height: 16,
          ),
          const MyTextFormField(
              label: "Customer Name", icon: LineIcons.addressCard),
          const SizedBox(
            height: 16,
          ),
          const MyTextFormField(label: "Customer Phone", icon: LineIcons.phone),
          const SizedBox(
            height: 16,
          ),
          const MyTextFormField(
              label: "Others", icon: LineIcons.tags, lines: 4),
        ],
      ),
    );
  }
}
