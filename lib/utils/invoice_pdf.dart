import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makemywindoor/models/project.dart';
import 'package:makemywindoor/models/project_dimens.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
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
    // pdf.addPage(
    //   pw.Page(
    //     build: (pw.Context context) => pw.Column(
    //       children: <pw.Widget>[
    //         pw.Text('Begin'),
    //         pw.Spacer(),
    //         // pw.Expanded(child: pw.SizedBox.shrink()),
    //         pw.Footer(trailing: pw.Image(image, height: 24)),
    //         pw.SizedBox(
    //           height: 16,
    //         ),
    //         pw.Footer(
    //           padding: pw.EdgeInsets.zero,
    //           trailing: pw.Row(
    //               mainAxisAlignment: pw.MainAxisAlignment.end,
    //               children: [
    //                 pw.Text(" - Powered By "),
    //                 pw.Text(
    //                   "https://makemywindoor.com",
    //                   style: pw.TextStyle(
    //                       decoration: pw.TextDecoration.underline,
    //                       fontWeight: pw.FontWeight.bold,
    //                       color: PdfColor.fromHex("#0066ff")),
    //                 ),
    //               ]),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    pdf.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => [
                // pw.Header(
                //   text: ,
                // ),
                pw.Text(
                    project.createdBy.name +
                        (project.createdBy.company != null
                            ? " (" + project.createdBy.company! + ") "
                            : ""),
                    style: pw.TextStyle(
                        fontSize: 20, fontWeight: pw.FontWeight.bold)),
                pw.Text(project.createdBy.phone),
                pw.Text(project.createdBy.email),
                pw.Divider(height: 24.0),

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
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
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
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                const pw.TextSpan(
                                  text: " mm x ",
                                ),
                                pw.TextSpan(
                                  text: e.width.toString(),
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                const pw.TextSpan(
                                  text: " mm = ",
                                ),
                                pw.TextSpan(
                                  text: e.esft.toStringAsFixed(2),
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                const pw.TextSpan(
                                  text: " sq.ft x ",
                                ),
                                pw.TextSpan(
                                  text: e.rate.toString(),
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                const pw.TextSpan(
                                  text: " rate",
                                ),
                              ],
                            ),
                          ),
                          pw.Spacer(),
                          pw.Text(" = "),
                          pw.Text(
                            (e.esft * e.rate).toStringAsFixed(2),
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
                          text: " = " +
                              (project.totalCost * 18 / 100).toStringAsFixed(2),
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                    textAlign: pw.TextAlign.right,
                  ),
                ),
                pw.SizedBox(
                  height: 8,
                ),
                pw.SizedBox(
                  width: double.infinity,
                  child: pw.Text(
                    "Total : " + project.totalCharge.round().toString(),
                    textAlign: pw.TextAlign.right,
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.SizedBox(
                  height: 24,
                ),
                pw.Spacer(),

                pw.Footer(trailing: pw.Image(image, height: 24)),
                pw.SizedBox(
                  height: 16,
                ),
                pw.Footer(
                  padding: pw.EdgeInsets.zero,
                  trailing: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Text(" - Powered By "),
                        pw.Text(
                          "https://makemywindoor.com",
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColor.fromHex("#0066ff")),
                        ),
                      ]),
                ),
              ]),
    );

    if ((await Permission.storage.request()).isGranted) {
      Directory? appDocDirectory = await getExternalStorageDirectory();
      File file = File(
          '${appDocDirectory!.path}/${project.projectDetails.customerName}_${project.projectDetails.customerNumber}.pdf');

      file = await file.writeAsBytes(await pdf.save());

      //
      if (isLoading) {
        Navigator.pop(context);
      }
      await Share.shareFiles([file.path],
          text: project.projectDetails.customerName);
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
