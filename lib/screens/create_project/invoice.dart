import 'package:flutter/material.dart';
import 'package:makemywindoor/models/project.dart';
import 'package:makemywindoor/models/project_dimens.dart';

class InvoiceScreen extends StatelessWidget {
  final Project project;
  const InvoiceScreen({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(project.projectDetails.projectName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(
          project.projectDetails.customerName,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          project.projectDetails.customerNumber,
        ),
        if (project.projectDetails.others != null)
          Text(
            project.projectDetails.others!,
          ),
        const Divider(),
        ...project.projectDimensions.map((ProjectDimensions e) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                (TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: e.dimensionID + ": "),
                    TextSpan(
                        text: e.type,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )),
              ),
              if (e.remarks!.isNotEmpty) Text(e.remarks!),
              if (e.remarks!.isNotEmpty)
                const SizedBox(
                  height: 8,
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: e.height.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: " cms x ",
                        ),
                        TextSpan(
                          text: e.width.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: " cms = ",
                        ),
                        TextSpan(
                          text: e.esft.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: " sq.ft x ",
                        ),
                        TextSpan(
                          text: e.rate.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: " rate",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text(" = "),
                  Text(
                    (e.esft * e.rate).toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          );
        }).toList(),
        const Divider(),
        SizedBox(
          width: double.infinity,
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "+ 18% GST "),
                TextSpan(
                  text:
                      " = " + (project.totalCost * 18 / 100).toStringAsFixed(2),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            "Total : " + project.totalCharge.toStringAsFixed(2),
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 24.0,
        )
      ],
    );
  }
}
