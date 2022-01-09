import 'package:flutter/material.dart';
import 'package:makemywindoor/helperwidgets/my_appBar.dart';
import 'package:makemywindoor/helperwidgets/my_button.dart';
import 'package:makemywindoor/model/project_details.dart';
import 'package:makemywindoor/screens/create_project/customer_details.dart';
import 'package:makemywindoor/screens/create_project/dimens.dart';
import 'package:makemywindoor/utils/my_constants.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  int _activeStepIndex = 0;
  ProjectDetails pdts = ProjectDetails.empty();

  final GlobalKey<FormState> _detailForm = GlobalKey<FormState>();
  final GlobalKey<FormState> _dimensForm = GlobalKey<FormState>();

  List<Step> stepList() => [
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 0,
            title: const Text('Project Details'),
            content: CustomerDetails(
              detailForm: _detailForm,
            )),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Dimensions'),
            // content: DimensionsScreen(
            //   dimensForm: _dimensForm,
            // )),
            content: DimensScreen(
              dimensForm: _dimensForm,
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
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: MyButton(
                    title: isLastStep ? 'Submit' : 'Next',
                    onPressed: details.onStepContinue!,
                    // widthx: SizeConfig.blockSizeHorizontal * 100,
                    // heightX: SizeConfig.blockSizeVertical * 5,
                    // colorx: Colors.transparent,
                    // radiusX: 5.0,
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
}
