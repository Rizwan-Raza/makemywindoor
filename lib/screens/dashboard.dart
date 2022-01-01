import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/utils/SizeConfig.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Selected Page Index
  int _selectedIndex = 0;

  // Bottom Pages
  List<Widget> pages = [
    Container(
      color: Colors.red,
      child: const Center(
        child: Text('Dashboard'),
      ),
      key: const PageStorageKey("Page1"),
    ),
    Container(
      color: Colors.yellow,
      child: const Center(
        child: Text('My Products'),
      ),
      key: const PageStorageKey("Page2"),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text('Create'),
      ),
      key: const PageStorageKey("Page3"),
    ),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Products for sale'),
      ),
      key: const PageStorageKey("Page4"),
    ),
    Container(
      color: Colors.pink,
      child: const Center(
        child: Text('My Profile'),
      ),
      key: const PageStorageKey("Page5"),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

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
