import 'package:flutter/material.dart';
import 'package:makemywindoor/helperwidgets/my_appBar.dart';
import 'package:makemywindoor/screens/auth/login.dart';
import 'package:makemywindoor/services/user_service.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:provider/provider.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbarTitle: MyConstants.appbarTitle[1],
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                  Provider.of<UserServices>(context, listen: false).logout();
                },
                child: const Text("Logout"))),
      ),
    );
  }
}
