import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/helperwidgets/my_appBar.dart';
import 'package:makemywindoor/helperwidgets/my_button.dart';
import 'package:makemywindoor/helperwidgets/my_textfield.dart';
import 'package:makemywindoor/model/project_details.dart';
import 'package:makemywindoor/model/project_dimens.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/utils/size_config.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  int _activeStepIndex = 0;
  ProjectDetails pdts = ProjectDetails.empty();
  ProjectDimensions pdim = ProjectDimensions.empty();

  final GlobalKey<FormState> _detailForm = GlobalKey<FormState>();
  final GlobalKey<FormState> _dimensForm = GlobalKey<FormState>();

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Project Details'),
          content: Form(
            key: _detailForm,
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
                const MyTextFormField(
                    label: "Customer Phone", icon: LineIcons.phone),
                const SizedBox(
                  height: 16,
                ),
                const MyTextFormField(
                    label: "Others", icon: LineIcons.tags, lines: 4),
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Dimensions'),
            content: Form(
              key: _dimensForm,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Material(
                        elevation: 2.0,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          height: 48,
                          color: Colors.transparent,
                        ),
                      ),
                      // TextFormField(
                      //   cursorColor: Colors.amber[700],
                      //   decoration: InputDecoration(
                      //       hintText: hText,
                      //       fillColor: Colors.transparent,
                      //       prefixIcon: Padding(
                      //         padding: const EdgeInsets.all(12.0),
                      //         child: Align(
                      //           alignment: Alignment.topCenter,
                      //           widthFactor: 1.0,
                      //           heightFactor: lines * 1.0,
                      //           child: Icon(
                      //             icon,
                      //             // color: Colors.amber,
                      //           ),
                      //         ),
                      //       ),
                      //       border: InputBorder.none,
                      //       contentPadding: const EdgeInsets.symmetric(
                      //           horizontal: 25, vertical: 13)),
                      // ),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Row(
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(12, 12, 8, 12),
                              child: Icon(LineIcons.hardHat,
                                  size: 24, color: Colors.black54),
                            ),
                            SizedBox(
                              // color: Colors.red,
                              width: SizeConfig.blockSizeHorizontal * 73,
                              child: DropdownButton<String>(
                                value: pdim.type,
                                icon: Expanded(
                                  child: Row(
                                    children: const [
                                      Expanded(child: SizedBox()),
                                      Icon(LineIcons.angleDown),
                                    ],
                                  ),
                                ),
                                itemHeight: 48,
                                underline: Container(
                                  height: 0,
                                ),
                                items: <String>[
                                  'Type',
                                  'Custom',
                                  'Door',
                                  'Window'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    enabled: value != 'Type',
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: value == "Type"
                                              ? Colors.black54
                                              : Colors.black),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (type) {
                                  setState(() {
                                    pdim.type = type!;
                                  });
                                },
                                hint: const Text("Type"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const MyTextFormField(
                      label: "Height", icon: LineIcons.rulerVertical),
                  const SizedBox(
                    height: 16,
                  ),
                  const MyTextFormField(
                      label: "Width", icon: LineIcons.rulerHorizontal),
                  const SizedBox(
                    height: 16,
                  ),
                  const MyTextFormField(
                      label: "Remarks", icon: LineIcons.pencilRuler),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Share'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Password: *****'),
              ],
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbarTitle: MyConstants.appbarTitle[1],
      ),
      body: Stepper(
        // margin: EdgeInsets.zero,
        type: StepperType.horizontal,

        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
            // print('Submited');
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }

          setState(() {
            _activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: MyButtonHelperWidget(
                    titleX: isLastStep ? 'Submit' : 'Next',
                    onPressedFunction: details.onStepContinue!,
                    // widthx: SizeConfig.blockSizeHorizontal * 100,
                    // heightX: SizeConfig.blockSizeVertical * 5,
                    // colorx: Colors.transparent,
                    // radiusX: 5.0
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
