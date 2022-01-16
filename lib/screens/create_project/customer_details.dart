import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/helperwidgets/my_textfield.dart';
import 'package:makemywindoor/model/project_details.dart';

class CustomerDetails extends StatelessWidget {
  final GlobalKey<FormState> detailForm;
  final ProjectDetails projectDetails;
  const CustomerDetails(
      {Key? key, required this.detailForm, required this.projectDetails})
      : super(key: key);

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
              },
              onSaved: (value) {
                projectDetails.projectName = value!;
              }),
          const SizedBox(
            height: 16,
          ),
          MyTextFormField(
              label: "Customer Name",
              icon: LineIcons.addressCard,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter customer name';
                }
              },
              onSaved: (value) {
                projectDetails.customerName = value!;
              }),
          const SizedBox(
            height: 16,
          ),
          MyTextFormField(
              label: "Customer Phone",
              icon: LineIcons.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter customer phone';
                }
              },
              onSaved: (value) {
                projectDetails.customerNumber = value!;
              }),
          const SizedBox(
            height: 16,
          ),
          MyTextFormField(
              label: "Others",
              icon: LineIcons.tags,
              lines: 4,
              onSaved: (value) {
                projectDetails.others = value!;
              }),
        ],
      ),
    );
  }
}
