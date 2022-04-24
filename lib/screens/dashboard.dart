import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/screens/create_project/create_project.dart';
import 'package:makemywindoor/screens/home/home.dart';
import 'package:makemywindoor/screens/my_projects.dart';
import 'package:makemywindoor/screens/products_to_sell.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/widgets/my_appbar.dart';
import 'package:makemywindoor/widgets/require_login.dart';

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
    const RequireLogin(child: MyProjects(), key: PageStorageKey("Page2")),
    const RequireLogin(
        child: CreateProjectScreen(), key: PageStorageKey("Page3")),
    const ProductsScreen(key: PageStorageKey("Page4")),
    const RequireLogin(child: MyAccount(), key: PageStorageKey("Page5")),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: _selectedIndex != 2,
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
          title: _selectedIndex == 0
              ? ""
              : MyConstants.appbarTitle[_selectedIndex - 1]),
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
      // bottomNavigationBar: _getBottomBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.folderOpen),
            label: "Projects",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.dotCircle),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.shoppingCart),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.user),
            label: "Account",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
