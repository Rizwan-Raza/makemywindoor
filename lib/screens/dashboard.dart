import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/utils/SizeConfig.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/imgs/logo.png",
                  gaplessPlayback: true,
                ))),
      ),
      body: const Center(
        child: Text('Dashboard'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.amber,
        ),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.amber,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                LineIcons.home,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                LineIcons.briefcase,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 16,
            ),
            // IconButton(
            //   icon: const Icon(
            //     LineIcons.dotCircle,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: const Icon(
                LineIcons.shoppingCart,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                LineIcons.user,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: const <Widget>[],
      //   ),
      //   // notchedShape: const CircularNotchedRectangle(),
      //   color: Colors.blueGrey,
      // ),
    );
  }
}
