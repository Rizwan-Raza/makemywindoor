import 'package:flutter/material.dart';
import 'package:makemywindoor/models/user.dart';
import 'package:makemywindoor/screens/auth/login.dart';
import 'package:makemywindoor/services/user_service.dart';
import 'package:provider/provider.dart';

class RequireLogin extends StatelessWidget {
  final Widget child;
  const RequireLogin({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<UserServices>(context).getState(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.amber,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          return child;
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
