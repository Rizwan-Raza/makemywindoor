import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/helperwidgets/my_appBar.dart';
import 'package:makemywindoor/screens/create_project.dart';
import 'package:makemywindoor/screens/home.dart';
import 'package:makemywindoor/screens/my_projects.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/utils/size_config.dart';

import 'myaccount/my_account.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Selected Page Index

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 2;

  // Bottom Pages
  List<Widget> pages = [
    Home(),
    Scaffold(
      appBar: MyAppBar(
        appbarTitle: MyConstants.appbarTitle[0],
      ),
      body: Container(
        color: Colors.yellow,
        child: const Center(
          child: Text('My Products'),
        ),
        key: const PageStorageKey("Page2"),
      ),
    ),
    const CreateProjectScreen(key: PageStorageKey("Page3")),
    const MyProjects(key: PageStorageKey("Page4")),
    const MyAccount(key: PageStorageKey("Page5")),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages.map((Widget p) {
          return PageStorage(
            child: p,
            bucket: bucket,
          );
        }).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        tooltip: 'Increment',
        child: const Icon(
          LineIcons.plus,
          color: Colors.amber,
        ),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        // color: Colors.amber,
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
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                LineIcons.briefcase,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
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
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                LineIcons.user,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 4;
                });
              },
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
