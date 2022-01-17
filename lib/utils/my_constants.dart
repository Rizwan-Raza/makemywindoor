import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class MyConstants {
  static String rateTheApp = Platform.isAndroid
      ? "https://play.google.com/store/apps/details?id=com.makemy.makemywindoor"
      : 'https://apps.apple.com/us/app/';
  static String fbLink = "https://www.facebook.com/";
  static String instaLink = "https://www.instagram.com/makemywindoor";
  static String twitterLink = "https://twitter.com/";

  static const String companyEmail = "info@makemywindoor.com";
  static const String companypass = "makemywindoor##";
  static const String smtpMailHost = "mail.makemywindoor.com";
  static const int smtpPort = 25;

  static TextStyle rechareBillPaymentHeaderStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontWeight: FontWeight.normal, color: Colors.black, fontSize: 20),
  );
  static TextStyle nameLoginRegStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontWeight: FontWeight.normal, color: Colors.black, fontSize: 14),
  );
  static TextStyle moduleNameStyle = GoogleFonts.inter(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 13));
  static TextStyle buttonLoginRegStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14),
  );

  static TextStyle myAccountTitleStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontWeight: FontWeight.normal, color: Colors.black45, fontSize: 14),
  );

  static TextStyle myAccountBenifitTitleStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
  );

  static List<String> appbarTitle = [
    'My Projects',
    'Create Project',
    'Products Sell',
    'My Account'
  ];
  static List<String> myAccountBenifitIcontitle = [
    'Unlock e-Cash',
    'Manage your bookings',
    'Faster Checkout',
  ];

  static List<IconData> myAccountIconLeft = [
    LineIcons.user,
    LineIcons.share,
    LineIcons.star,
    LineIcons.thumbsUpAlt,
    LineIcons.identificationCard,
    LineIcons.phone,
    LineIcons.alternateSignOut,
  ];
  static List<String> myAccountIcontitle = [
    'My Profile',
    'Share the App',
    'Rate Us',
    'Social Networks',
    'About MakeMyWindoor',
    'Contact us',
    'Logout'
  ];
  static const String aboutUs =
      'Our 10000+ users are the 10000+ reasons why we lead , practical designs and plugins with advance features.Most of the App fails after few months of launch because of lacking technical support. A good amount of monetory and labor is involved which makes it expensive to afford.\n\n MakeMyWindoor is the cost effective solutions for the customers looking for affordable ready made white label travel booking engine.Let a local enrich your discovery of what a Place has to offer. Explore Our All Inclusive Packages.\n\nQuality Has Always Been Our First Priority. Skilled travel professionals for providing reliable, personalized and professional services.Why Take Common Tours When You Can Have Your Own. Let Us Be Your Travel Tailor For An Life Time Experience Tailored Just For You.When You Want The Highest Quality & Reasonable Prices, Look No Further , Get In Touch With Us.';
}
