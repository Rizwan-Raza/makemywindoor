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
          'About makemywindoor',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: .2,
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
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'About makemywindoor',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: .2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(
                    //       builder: (context) => TermsandConditionScreen()),

                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                        child: Text(
                      'TERMS & CONDITIONS',
                      style: GoogleFonts.inter(
                        color: ColorCodeGen.colorFromHex('#E53E8E'),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        // letterSpacing: .2,
                      ),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(builder: (context) => PrivacyScreen()),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                        child: Text(
                      'PRIVACY POLICY',
                      style: GoogleFonts.inter(
                        color: ColorCodeGen.colorFromHex('#E53E8E'),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Center(
                  child: Text(
                'By using makemywindoor you agree to our TnC and Privacy Policy.',
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 14,
                  letterSpacing: .2,
                ),
              )),
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
