import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makemywindoor/utils/color_generator.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/utils/size_config.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ColorCodeGen.colorFromHex('#342794'),
        title: Text(
          'About Us',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical * 3),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'MakeMyWindoor',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: .2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                  child: Text(
                MyConstants.aboutUs,
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 14,
                  letterSpacing: .2,
                ),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        // color: Colors.red,
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'App Version : 1.0.0',
            style: GoogleFonts.inter(
              color: Colors.grey,
              fontSize: 14,
              letterSpacing: .2,
            ),
          ),
        ),
      ),
    );
  }
}
