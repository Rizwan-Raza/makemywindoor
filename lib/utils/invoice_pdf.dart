import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makemywindoor/model/project.dart';
import 'package:makemywindoor/model/project_dimens.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

class InvoicePDF {
  static Future<void> createPDF(
      BuildContext context, Project project, bool isLoading) async {
    pw.Document pdf = pw.Document(
        theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(
                font: pw.Font.ttf(
                    await rootBundle.load("assets/OpenSans-Regular.ttf")))));

    final image = await imageFromAssetBundle("assets/imgs/logo.png");
    pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Column(children: [
        pw.Center(child: pw.Image(image, height: 50)),
        pw.SizedBox(height: 20),
        pw.Header(
            text: "Make My Windoor - Invoice of " +
                project.projectDetails.projectName),
        pw.SizedBox(
          height: 24.0,
        ),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.RichText(
              text: pw.TextSpan(
            children: <pw.TextSpan>[
              const pw.TextSpan(text: "Project Name: "),
              pw.TextSpan(
                  text: project.projectDetails.projectName,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          )),
          pw.RichText(
              text: pw.TextSpan(
            children: <pw.TextSpan>[
              const pw.TextSpan(text: "Customer Name: "),
              pw.TextSpan(
                  text: project.projectDetails.customerName,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          )),
          pw.RichText(
              text: pw.TextSpan(
            children: <pw.TextSpan>[
              const pw.TextSpan(text: "Customer Phone: "),
              pw.TextSpan(
                  text: project.projectDetails.customerNumber,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          )),
          if (project.projectDetails.others != null)
            pw.Text(
              "Others: " + project.projectDetails.others!,
            ),
          pw.Divider(height: 24.0),
          ...project.projectDimensions.map((ProjectDimensions e) {
            return pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.RichText(
                    text: pw.TextSpan(
                  children: <pw.TextSpan>[
                    pw.TextSpan(text: e.dimensionID + ": "),
                    pw.TextSpan(
                        text: e.type,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                )),
                if (e.remarks!.isNotEmpty) pw.Text(e.remarks!),
                if (e.remarks!.isNotEmpty)
                  pw.SizedBox(
                    height: 8,
                  ),
                pw.Row(
                  mainAxisSize: pw.MainAxisSize.max,
                  children: [
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: e.height.toString(),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          const pw.TextSpan(
                            text: " inch x ",
                          ),
                          pw.TextSpan(
                            text: e.width.toString(),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          const pw.TextSpan(
                            text: " inch = ",
                          ),
                          pw.TextSpan(
                            text: e.esft.toString(),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          const pw.TextSpan(
                            text: " sq.ft x ",
                          ),
                          pw.TextSpan(
                            text: e.rate.toString(),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          const pw.TextSpan(
                            text: " per sq.ft",
                          ),
                        ],
                      ),
                    ),
                    pw.Spacer(),
                    pw.Text(" = "),
                    pw.Text(
                      (e.height * e.width * e.rate).toString(),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 24,
                ),
              ],
            );
          }).toList(),
          pw.Divider(),
          pw.SizedBox(
            width: double.infinity,
            child: pw.RichText(
              text: pw.TextSpan(
                children: [
                  const pw.TextSpan(text: "+ 18% GST "),
                  pw.TextSpan(
                    text: " = " + (project.totalCost * 18 / 100).toString(),
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              textAlign: pw.TextAlign.right,
            ),
          ),
          pw.SizedBox(
            width: double.infinity,
            child: pw.Text(
              "Total : " + project.totalCharge.toString(),
              textAlign: pw.TextAlign.right,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(
            height: 24.0,
          )
        ]),
      ]),
    ));

    if ((await Permission.storage.request()).isGranted) {
      Directory? appDocDirectory = await getExternalStorageDirectory();
      File file = File('${appDocDirectory!.path}/Invoice.pdf');

      file = await file.writeAsBytes(await pdf.save());

      //
      if (isLoading) {
        Navigator.pop(context);
      }
      await Share.shareFiles([file.path], text: "Make My Windoor - Invoice");
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Permission Denied"),
              content: const Text(
                  "Please grant storage permission to save the file"),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }
}
