// import 'dart:developer';

// import 'package:glideFares/screens/contactus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:glideFares/AboutUsFAQ.dart';

// import 'package:glideFares/Model/my_user.dart';
// import 'package:glideFares/SettingScreen.dart';
// import 'package:glideFares/deviceType/SizeConfig.dart';
// import 'package:glideFares/helperwidgets/HelperWidget.dart';
// import 'package:glideFares/helperwidgets/MyButtonHelperWidget.dart';
// import 'package:glideFares/screens/AboutUs.dart';
// import 'package:glideFares/screens/myaccount/LoginScreen.dart';
// import 'package:glideFares/screens/myaccount/UserProfileScreen.dart';
// import 'package:glideFares/screens/rechargebillpayment/HelpAndSupport.dart';
// import 'package:glideFares/utils/ModuleName.dart';
// import 'package:glideFares/utils/color_code_generator.dart';
// import 'package:glideFares/utils/constants.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:ui' as ui;
// import 'package:provider/provider.dart';
// import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MyAccount extends StatefulWidget {
//   @override
//   _MyAccountState createState() => _MyAccountState();
// }

// class _MyAccountState extends State<MyAccount> {
//   late HelperWidget helperWidget;
//   late ModuleName moduleName;
//   late ScrollController _scrollControllerTopBenifitModule;
//   @override
//   void initState() {
//     super.initState();
//     _scrollControllerTopBenifitModule = ScrollController();
//   }

//   void onMyAccountLoginPressed() {
//     Navigator.of(context).push(PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return LoginScreen();
//       },
//       // transitionDuration: Duration(milliseconds: 500),
//       // reverseTransitionDuration: Duration(milliseconds: 200),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         // return SharedAxisTransition(
//         //     child: child,
//         //     animation:
//         //         CurvedAnimation(curve: Curves.decelerate, parent: animation),
//         //     secondaryAnimation: secondaryAnimation,
//         //     transitionType: SharedAxisTransitionType.vertical);
//         return new FadeTransition(
//             opacity:
//                 CurvedAnimation(curve: Curves.decelerate, parent: animation),
//             child: child);
//         // return RotationTransition(
//         //   turns: animation,
//         //   child: child,
//         // );
//       },
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     helperWidget = context.read<HelperWidget>();
//     moduleName = context.read<ModuleName>();
//     return Scaffold(
//       appBar: helperWidget.myAppBar(moduleName.appbarTitle[1]),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             context.read<MyUser>().email == null
//                 ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: SizeConfig.blockSizeVertical * 2,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 15,
//                         ),
//                         child: Text(
//                           'Benifits',
//                           style: GoogleFonts.inter(
//                             textStyle: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 16),
//                           ),
//                         ),
//                       ),
//                       Stack(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 15),
//                             child: Container(
//                               width: SizeConfig.screenWidth,
//                               height: SizeConfig.blockSizeVertical * 10,
//                               // color: Colors.red,
//                               child: ListView.builder(
//                                   controller: _scrollControllerTopBenifitModule,
//                                   scrollDirection: Axis.horizontal,
//                                   //shrinkWrap: true,
//                                   itemCount: moduleName
//                                       .myAccountBenifitIcontitle.length,
//                                   itemBuilder: (context, index) {
//                                     return helperWidget.myAccountBenifitRow(
//                                         Icons.check,
//                                         moduleName
//                                             .myAccountBenifitIcontitle[index]);
//                                   }),
//                             ),
//                           ),
//                           Positioned(
//                             top: SizeConfig.screenWidth > 320
//                                 ? SizeConfig.blockSizeVertical * 2.5
//                                 : SizeConfig.blockSizeVertical * 1.5,
//                             right: SizeConfig.blockSizeHorizontal * -3,
//                             child: IconButton(
//                               onPressed: () {
//                                 _scrollControllerTopBenifitModule.animateTo(
//                                     _scrollControllerTopBenifitModule
//                                         .position.maxScrollExtent,
//                                     duration: const Duration(milliseconds: 400),
//                                     curve: Curves.fastOutSlowIn);
//                               },
//                               icon: FaIcon(
//                                 Icons.keyboard_arrow_right_sharp,
//                                 color: Colors.black,
//                                 size: 32,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       Center(
//                         child: MyButtonHelperWidget(
//                             titleX: moduleName.loginButtonName[1],
//                             onPressedFunction: onMyAccountLoginPressed,
//                             widthx: SizeConfig.blockSizeHorizontal * 90,
//                             heightX: SizeConfig.blockSizeVertical * 6.5,
//                             colorx: ColorCodeGen.colorFromHex('#E53E8E'),
//                             radiusX: 2.0),
//                       ),
//                     ],
//                   )
//                 : userProfileBox(),
//             SizedBox(
//               height: SizeConfig.blockSizeVertical * 2,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.0),
//               child: helperWidget.myDivider(),
//             ),
//             // context.watch<MyUser>().email == null
//             //       ? SizedBox(
//             //           height: 0,
//             //         )
//             //       :  Material(
//             //   child: InkWell(
//             //     onTap: () {
//             //       onClickMethod(i);
//             //     },
//             //     child: Padding(
//             //       padding: EdgeInsets.all(15.0),
//             //       child: helperWidget.myAccountRow(
//             //           moduleName.myAccountIconLeft[i],
//             //           moduleName.myAccountIcontitle[i]),
//             //     ),
//             //   ),
//             // ),
//             SizedBox(
//               height: SizeConfig.blockSizeVertical * 2,
//             ),
//             for (int i = 0; i < moduleName.myAccountIconLeft.length; i++)
//               i == 0
//                   ? context.watch<MyUser>().email != null
//                       ? Material(
//                           child: InkWell(
//                             onTap: () {
//                               onClickMethod(i);
//                             },
//                             child: Padding(
//                               padding: EdgeInsets.all(15.0),
//                               child: helperWidget.myAccountRow(
//                                   moduleName.myAccountIconLeft[i],
//                                   moduleName.myAccountIcontitle[i]),
//                             ),
//                           ),
//                         )
//                       : SizedBox(
//                           height: 0,
//                         )
//                   : Material(
//                       child: InkWell(
//                         onTap: () {
//                           onClickMethod(i);
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.all(15.0),
//                           child: helperWidget.myAccountRow(
//                               moduleName.myAccountIconLeft[i],
//                               moduleName.myAccountIcontitle[i]),
//                         ),
//                       ),
//                     ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget userProfileBox() {
//     log(context.watch<MyUser>().toJson().toString());
//     return Padding(
//       padding: EdgeInsets.all(15.0),
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//               padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 30,
//                 backgroundImage: AssetImage('assets/avtar.png'),
//               )),
//           SizedBox(
//             width: SizeConfig.blockSizeHorizontal * 8,
//           ),
//           Flexible(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Hi,',
//                   style: moduleName.nameLoginRegStyle.copyWith(
//                       fontSize: 18,
//                       color: Colors.black45,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   context.watch<MyUser>().name! +
//                       ' ' +
//                       context.watch<MyUser>().lname!,
//                   overflow: TextOverflow.visible,
//                   style: moduleName.nameLoginRegStyle.copyWith(
//                       fontSize: 18,
//                       color: Colors.black45,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   context.watch<MyUser>().email!,
//                   overflow: TextOverflow.visible,
//                   style: moduleName.nameLoginRegStyle.copyWith(
//                       fontSize: 14,
//                       color: Colors.black45,
//                       fontWeight: FontWeight.normal),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   dynamic onClickMethod(int i) {
//     switch (i) {
//       case 0:
//         return openProfileScreen();
//       case 1:
//         return openSettingScreen();
//       case 2:
//         return onShareTap();
//       case 3:
//         return openURL(MyConstants.rateTheApp);
//       case 4:
//         return showBottomDialogSocialnetworks();
//       case 5:
//         return openFAQScreen();
//       case 6:
//         return openAboutUsScreen();
//       case 7:
//         return openContactUsScreen();
//       case 8:
//         return openHelpAndSupportScreen();
//     }
//   }

//   openHelpAndSupportScreen() {
//     Navigator.push(
//         context, CupertinoPageRoute(builder: (context) => HelpAndSupport()));
//   }

//   openContactUsScreen() {
//     Navigator.push(
//         context, CupertinoPageRoute(builder: (context) => ContactUs()));
//   }

//   openAboutUsScreen() {
//     Navigator.push(
//         context, CupertinoPageRoute(builder: (context) => AboutUs()));
//   }

//   openProfileScreen() {
//     Navigator.push(
//         context, CupertinoPageRoute(builder: (context) => UserProfileScreen()));
//   }

//   openSettingScreen() {
//     Navigator.push(
//         context, CupertinoPageRoute(builder: (context) => SettingScreen()));
//   }

//   openFAQScreen() {
//     // Navigator.push(
//     //   context,
//     //   PageTransition(
//     //     type: PageTransitionType.rightToLeft,
//     //     child: AboutUsFAQScreen(),
//     //   ),
//     // );
//     Navigator.push(
//         context, CupertinoPageRoute(builder: (context) => AboutUsFAQScreen()));
//   }

//   onShareTap() {
//     final RenderBox? box = context.findRenderObject() as RenderBox;
//     Share.share(MyConstants.rateTheApp,
//         subject: 'glideFares',
//         sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
//   }

//   openURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   showBottomDialogSocialnetworks() {
//     showGeneralDialog(
//       barrierLabel: "Social networks",
//       barrierDismissible: true,
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: Duration(milliseconds: 500),
//       context: context,
//       pageBuilder: (context, anim1, anim2) {
//         return Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             height: 80,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   color: Colors.white,
//                   width: 100,
//                   height: 80,
//                   child: FlatButton(
//                     onPressed: () async {
//                       openURL(MyConstants.fbLink);
//                     },
//                     child: Icon(
//                       FontAwesomeIcons.facebook,
//                       color: ColorCodeGen.colorFromHex('#4267B2'),
//                     ),
//                     // color: Colors.red,
//                   ),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   width: 100,
//                   height: 80,
//                   child: FlatButton(
//                       onPressed: () {
//                         openURL(MyConstants.instaLink);
//                       },
//                       child: ShaderMask(
//                           blendMode: BlendMode.srcIn,
//                           shaderCallback: (Rect bounds) {
//                             return ui.Gradient.linear(
//                               Offset(4.0, 20.0),
//                               Offset(2.0, 4.0),
//                               [
//                                 ColorCodeGen.colorFromHex('#C13584'),
//                                 ColorCodeGen.colorFromHex('#405DE6'),
//                               ],
//                             );
//                           },
//                           child: Icon(
//                             FontAwesomeIcons.instagram,
//                           ))),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   width: 100,
//                   height: 80,
//                   child: FlatButton(
//                     onPressed: () {
//                       openURL(MyConstants.twitterLink);
//                     },
//                     child: Icon(
//                       FontAwesomeIcons.twitter,
//                       color: ColorCodeGen.colorFromHex('#1DA1F2'),
//                     ),
//                     // color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//             // margin: EdgeInsets.only(bottom: 0, left: 5, right: 5),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               // borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (context, anim1, anim2, child) {
//         return SlideTransition(
//           position:
//               Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
//           child: child,
//         );
//       },
//     );
//   }
// }
