// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:makemywindoor/screens/create_project/create_project.dart';
import 'package:makemywindoor/screens/home/doorScreen.dart';
import 'package:makemywindoor/screens/home/windowScreen.dart';
import 'package:makemywindoor/utils/color_generator.dart';
import 'package:makemywindoor/utils/size_config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List title = ['Customize', 'Windows', 'Doors'];
  List titleimgURL = [
    'assets/imgs/home1.jpg',
    'assets/imgs/home2.jpg',
    'assets/imgs/home3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: SizedBox(
                height: 40,
                child: Image.asset(
                  "assets/imgs/logo.png",
                  gaplessPlayback: true,
                ))),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 5,
        children: [
          for (int i = 0; i < title.length; i++) windoorType(i),
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       for (int i = 0; i < title.length; i++)
      //         windoorType(titleimgURL[i]),
      //     ],
      //   ),
      // )
    );
  }

  Widget windoorType(int i) {
    return InkWell(
      onTap: () {
        switch (i) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateProjectScreen()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WindowScreen()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DoorScreen()),
            );
            break;
          default:
            break;
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            titleimgURL[i],
            fit: BoxFit.cover,
          ),
          Container(
            // color: ColorCodeGen.colorFromHex('hexColor'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 1.0],
                colors: [
                  ColorCodeGen.colorFromHex('#000000').withOpacity(.2),
                  ColorCodeGen.colorFromHex('#000000').withOpacity(.4),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              left: SizeConfig.blockSizeHorizontal * 10,
              child: Text(
                title[i],
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
