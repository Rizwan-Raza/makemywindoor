import 'package:flutter/material.dart';
import 'package:makemywindoor/helperwidgets/my_appBar.dart';
import 'package:makemywindoor/utils/my_constants.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbarTitle: MyConstants.appbarTitle[1],
      ),
      body: Container(
        color: Colors.green,
        child: const Center(
          child: Text('Create'),
        ),
      ),
    );
  }
}
