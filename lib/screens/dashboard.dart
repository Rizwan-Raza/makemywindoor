import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/screens/create_project/create_project.dart';
import 'package:makemywindoor/screens/home.dart';
import 'package:makemywindoor/screens/my_projects.dart';
import 'package:makemywindoor/screens/products_to_sell.dart';
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

  int _selectedIndex = 0;

  // Bottom Pages
  List<Widget> pages = [
    const Home(key: PageStorageKey("Page1")),
    const MyProjects(key: PageStorageKey("Page2")),
    const CreateProjectScreen(key: PageStorageKey("Page3")),
    const ProductsScreen(key: PageStorageKey("Page4")),
    const MyAccount(key: PageStorageKey("Page5")),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: _selectedIndex != 2,
      resizeToAvoidBottomInset: false,
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
        tooltip: 'Create Project',
        child: const Icon(
          LineIcons.plus,
          color: Colors.amber,
        ),
        elevation: 2.0,
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: BottomAppBar(
          //bottom navigation bar on scaffold
          color: Theme.of(context).colorScheme.primary,
          //shape of notch
          shape: const CircularNotchedRectangle(),
          //notche margin between floating button and bottom appbar
          // notchMargin: 5,
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineIcons.home,
                      color:
                          _selectedIndex == 0 ? Colors.black : Colors.black54,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color:
                            _selectedIndex == 0 ? Colors.black : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineIcons.briefcase,
                      color:
                          _selectedIndex == 1 ? Colors.black : Colors.black54,
                    ),
                    Text(
                      'My Projects',
                      style: TextStyle(
                        color:
                            _selectedIndex == 1 ? Colors.black : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 16,
              ),
              // IconButton(
              //   icon: Icon(
              //     LineIcons.dotCircle,
              //     color: Colors.white,
              //   ),
              //   onPressed: () {},
              // ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineIcons.shoppingCart,
                      color:
                          _selectedIndex == 3 ? Colors.black : Colors.black54,
                    ),
                    Text(
                      'Products',
                      style: TextStyle(
                        color:
                            _selectedIndex == 3 ? Colors.black : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineIcons.user,
                      color:
                          _selectedIndex == 4 ? Colors.black : Colors.black54,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        color:
                            _selectedIndex == 4 ? Colors.black : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
