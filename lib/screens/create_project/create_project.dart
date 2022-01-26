import 'package:flutter/material.dart';
import 'package:makemywindoor/models/project.dart';
import 'package:makemywindoor/models/project_dimens.dart';
import 'package:makemywindoor/screens/create_project/customer_details.dart';
import 'package:makemywindoor/screens/create_project/dimensions.dart';
import 'package:makemywindoor/screens/create_project/invoice.dart';
import 'package:makemywindoor/services/project_service.dart';
import 'package:makemywindoor/services/user_service.dart';
import 'package:makemywindoor/utils/invoice_pdf.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/widgets/my_appbar.dart';
import 'package:makemywindoor/widgets/my_button.dart';
import 'package:provider/provider.dart';

class CreateProjectScreen extends StatefulWidget {
  final bool isEdit;
  final Project? project;
  const CreateProjectScreen({
    Key? key,
    this.isEdit = false,
    this.project,
  }) : super(key: key);

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  int _activeStepIndex = 0;
  late Project project;
  @override
  void initState() {
    super.initState();
    project = widget.isEdit ? widget.project! : Project.empty();
  }

  final GlobalKey<FormState> _detailForm = GlobalKey<FormState>();
  final GlobalKey<FormState> _dimensForm = GlobalKey<FormState>();

  List<Step> stepList() => [
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 0,
            title: const Text('Details'),
            content: CustomerDetails(
              detailForm: _detailForm,
              projectDetails: project.projectDetails,
              isEdit: widget.isEdit,
            )),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Dimensions'),
            content: DimensionScreen(
              dimensForm: _dimensForm,
              projectDimensions: project.projectDimensions,
              isEdit: widget.isEdit,
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Share'),
            content: InvoiceScreen(
              project: project,
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbarTitle:
            widget.isEdit ? "Edit Project" : MyConstants.appbarTitle[1],
      ),
      body: Stepper(
        // margin: EdgeInsets.zero,
        type: StepperType.horizontal,

        currentStep: _activeStepIndex,
        // margin: EdgeInsets.all(500),
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < 2) {
            if (validate()) {
              setState(() {
                _activeStepIndex = _activeStepIndex + 1;
              });
            }
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text(widget.isEdit ? 'Editing' : 'Creating'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text((widget.isEdit ? 'Editing' : 'Creating') +
                              ' Project, please wait'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(child: CircularProgressIndicator()),
                        ],
                      ));
                });

            Provider.of<ProjectServices>(context, listen: false)
                .createProject(
              project,
            )
                .then((value) {
              _detailForm.currentState!.reset();
              _dimensForm.currentState!.reset();
              // lessgo!
              InvoicePDF.createPDF(context, project, true).then((value) {
                setState(() {
                  _activeStepIndex = 0;
                });
                widget.isEdit ? Navigator.pop(context) : null;
              });
            });
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          // if (_activeStepIndex < (stepList().length - 1)) {
          // validate();
          setState(() {
            _activeStepIndex -= 1;
          });
          // }
        },
        onStepTapped: (int index) {
          if (index < _activeStepIndex) {
            setState(() {
              _activeStepIndex -= 1;
            });
          }
          if (validate()) {
            setState(() {
              _activeStepIndex = index;
            });
          }
        },
        controlsBuilder: (context, details) {
          final isLastStep = _activeStepIndex == stepList().length - 1;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_activeStepIndex > 0)
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: details.onStepCancel,
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: MyButton(
                    title: isLastStep ? 'Share' : 'Next',
                    onPressed: details.onStepContinue!,
                    min: true,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  bool validate() {
    switch (_activeStepIndex) {
      case 0:
        if (_detailForm.currentState!.validate()) {
          _detailForm.currentState!.save();
          return true;
        }
        break;
      case 1:
        if (_dimensForm.currentState!.validate()) {
          _dimensForm.currentState!.save();
          project.totalCost = (project.projectDimensions
              .map((ProjectDimensions e) => e.esft * e.rate)
              .reduce((a, b) => a + b));
          project.totalCharge =
              project.totalCost + (project.totalCost * 18 / 100);
          project.createdBy =
              Provider.of<UserServices>(context, listen: false).currentUser!;
          project.status = 'Pending';
          !widget.isEdit
              ? project.projectID =
                  DateTime.now().millisecondsSinceEpoch.toString()
              : null;
          return true;
        }
        if (project.projectDimensions.length > 2) {
          setState(() {});
        }
        break;
    }
    // return true;
    return false;
  }
}
