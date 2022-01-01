import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/helperwidgets/my_appBar.dart';
import 'package:makemywindoor/screens/contact_us.dart';
import 'package:makemywindoor/utils/color_generator.dart';
import 'package:makemywindoor/utils/my_constants.dart';

import 'package:makemywindoor/utils/size_config.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

import '../about_us.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  late ScrollController _scrollControllerTopBenifitModule;
  @override
  void initState() {
    super.initState();
    _scrollControllerTopBenifitModule = ScrollController();
  }

  // void onMyAccountLoginPressed() {
  //   Navigator.of(context).push(PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return LoginScreen();
  //     },
  //     // transitionDuration: Duration(milliseconds: 500),
  //     // reverseTransitionDuration: Duration(milliseconds: 200),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       // return SharedAxisTransition(
  //       //     child: child,
  //       //     animation:
  //       //         CurvedAnimation(curve: Curves.decelerate, parent: animation),
  //       //     secondaryAnimation: secondaryAnimation,
  //       //     transitionType: SharedAxisTransitionType.vertical);
  //       return new FadeTransition(
  //           opacity:
  //               CurvedAnimation(curve: Curves.decelerate, parent: animation),
  //           child: child);
  //       // return RotationTransition(
  //       //   turns: animation,
  //       //   child: child,
  //       // );
  //     },
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbarTitle: MyConstants.appbarTitle[3],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            'context.read<MyUser>().email' == null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Text(
                          'Benifits',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.blockSizeVertical * 10,
                              // color: Colors.red,
                              child: ListView.builder(
                                  controller: _scrollControllerTopBenifitModule,
                                  scrollDirection: Axis.horizontal,
                                  //shrinkWrap: true,
                                  itemCount: MyConstants
                                      .myAccountBenifitIcontitle.length,
                                  itemBuilder: (context, index) {
                                    return myAccountBenifitRow(
                                        Icons.check,
                                        MyConstants
                                            .myAccountBenifitIcontitle[index]);
                                  }),
                            ),
                          ),
                          Positioned(
                            top: SizeConfig.screenWidth > 320
                                ? SizeConfig.blockSizeVertical * 2.5
                                : SizeConfig.blockSizeVertical * 1.5,
                            right: SizeConfig.blockSizeHorizontal * -3,
                            child: IconButton(
                              onPressed: () {
                                _scrollControllerTopBenifitModule.animateTo(
                                    _scrollControllerTopBenifitModule
                                        .position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.fastOutSlowIn);
                              },
                              icon: const Icon(
                                LineIcons.alternateCompressArrows,
                                color: Colors.black,
                                size: 32,
                              ),
                            ),
                          )
                        ],
                      ),
                      // Center(
                      //   child: MyButtonHelperWidget(
                      //       titleX: moduleName.loginButtonName[1],
                      //       onPressedFunction: onMyAccountLoginPressed,
                      //       widthx: SizeConfig.blockSizeHorizontal * 90,
                      //       heightX: SizeConfig.blockSizeVertical * 6.5,
                      //       colorx: ColorCodeGen.colorFromHex('#E53E8E'),
                      //       radiusX: 2.0),
                      // ),
                    ],
                  )
                : userProfileBox(),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: myDivider(),
            ),
            // context.watch<MyUser>().email == null
            //       ? SizedBox(
            //           height: 0,
            //         )
            //       :  Material(
            //   child: InkWell(
            //     onTap: () {
            //       onClickMethod(i);
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.all(15.0),
            //       child: helperWidget.myAccountRow(
            //           moduleName.myAccountIconLeft[i],
            //           moduleName.myAccountIcontitle[i]),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            for (int i = 0; i < MyConstants.myAccountIconLeft.length; i++)
              i == 0
                  ? 'context.watch<MyUser>().email' != null
                      ? Material(
                          child: InkWell(
                            onTap: () {
                              onClickMethod(i);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: myAccountRow(
                                  MyConstants.myAccountIconLeft[i],
                                  MyConstants.myAccountIcontitle[i]),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                        )
                  : Material(
                      child: InkWell(
                        onTap: () {
                          onClickMethod(i);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: myAccountRow(MyConstants.myAccountIconLeft[i],
                              MyConstants.myAccountIcontitle[i]),
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }

  Widget myAccountRow(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black26,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(title, style: MyConstants.myAccountTitleStyle),
        const Expanded(child: SizedBox()),
        const Icon(
          Icons.keyboard_arrow_right_sharp,
          color: Colors.black26,
        ),
      ],
    );
  }

  Widget myAccountBenifitRow(IconData icon, String title) {
    return Row(
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(title, style: MyConstants.myAccountBenifitTitleStyle),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical * 3.5,
              horizontal: SizeConfig.blockSizeHorizontal * 1.8),
          child: const VerticalDivider(
            color: Colors.black26,
            thickness: 1,
          ),
        )
      ],
    );
  }

  Widget myDivider() {
    return Divider(
      color: Colors.grey.shade400,
    );
  }

  Widget userProfileBox() {
    // log(context.watch<MyUser>().toJson().toString());
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                backgroundImage: AssetImage('assets/imgs/avtar.png'),
              )),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi,',
                  style: MyConstants.nameLoginRegStyle.copyWith(
                      fontSize: 18,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'context.watch<MyUser>().name!' +
                      ' ' +
                      'context.watch<MyUser>().lname!',
                  overflow: TextOverflow.visible,
                  style: MyConstants.nameLoginRegStyle.copyWith(
                      fontSize: 18,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'context.watch<MyUser>().email!',
                  overflow: TextOverflow.visible,
                  style: MyConstants.nameLoginRegStyle.copyWith(
                      fontSize: 14,
                      color: Colors.black45,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  dynamic onClickMethod(int i) {
    switch (i) {
      case 0:
        return openProfileScreen();

      case 1:
        return onShareTap();
      case 2:
        return openURL(MyConstants.rateTheApp);
      case 3:
        return showBottomDialogSocialnetworks();

      case 4:
        return openAboutUsScreen();
      case 5:
        return openContactUsScreen();
    }
  }

  openContactUsScreen() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => const ContactUs()));
  }

  openAboutUsScreen() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => const AboutUs()));
  }

  openProfileScreen() {
    // Navigator.push(
    //     context, CupertinoPageRoute(builder: (context) => UserProfileScreen()));
  }

  onShareTap() {
    final RenderBox? box = context.findRenderObject() as RenderBox;
    Share.share(MyConstants.rateTheApp,
        subject: 'makemywindoor',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  showBottomDialogSocialnetworks() {
    showGeneralDialog(
      barrierLabel: "Social networks",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.white,
                  width: 100,
                  height: 80,
                  child: FlatButton(
                    onPressed: () async {
                      openURL(MyConstants.fbLink);
                    },
                    child: Icon(
                      LineIcons.facebook,
                      color: ColorCodeGen.colorFromHex('#4267B2'),
                    ),
                    // color: Colors.red,
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                  height: 80,
                  child: FlatButton(
                      onPressed: () {
                        openURL(MyConstants.instaLink);
                      },
                      child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return ui.Gradient.linear(
                              const Offset(4.0, 20.0),
                              const Offset(2.0, 4.0),
                              [
                                ColorCodeGen.colorFromHex('#C13584'),
                                ColorCodeGen.colorFromHex('#405DE6'),
                              ],
                            );
                          },
                          child: const Icon(
                            LineIcons.instagram,
                          ))),
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                  height: 80,
                  child: FlatButton(
                    onPressed: () {
                      openURL(MyConstants.twitterLink);
                    },
                    child: Icon(
                      LineIcons.twitter,
                      color: ColorCodeGen.colorFromHex('#1DA1F2'),
                    ),
                    // color: Colors.red,
                  ),
                ),
              ],
            ),
            // margin: EdgeInsets.only(bottom: 0, left: 5, right: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}
