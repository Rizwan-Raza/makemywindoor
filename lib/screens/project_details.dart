import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/models/project.dart';
import 'package:makemywindoor/screens/create_project/invoice.dart';
import 'package:makemywindoor/utils/invoice_pdf.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Project project;
  const ProjectDetailScreen({Key? key, required this.project})
      : super(key: key);

  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.project.projectDetails.projectName,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InvoiceScreen(project: widget.project),
              ElevatedButton.icon(
                  icon: const Icon(LineIcons.share),
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text('Loading'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('Creating PDF, please wait'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(child: CircularProgressIndicator()),
                                ],
                              ));
                        });

                    InvoicePDF.createPDF(context, widget.project, true)
                        .then((value) => Navigator.pop(context));
                  },
                  label: const Text("Share"))
            ],
          ),
        ),
      ),
    );
  }
}
