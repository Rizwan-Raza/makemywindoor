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
  static List<String> appbarTitle1 = [
    'Windows',
    'Doors',
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
      '''In This World Of Digitalisation , It Has Become mandatory for Every Business to Become Digital & Fast. Be it a Small Business. 
Make My Windoor Is an Effort to On Board All Such small Fabricators On Our Platform , Where They Can Measure , Quote & Share the Quotation To Their Client In No Time. 
We are Also A Manufacturing Company , Providing Services of Doors , Windows & Glazing Under our Brand Name - Make My Windoor. 
Make My Windoor is One & Only Such Platform In India Till Date & Available for Free For All..''';
  static const List<String> windowsScreenChips = [
    "Slider",
    "Casement",
    "Tilt and Turn",
    "Villa",
    "Glass to Glass",
    "Combination",
    "Fixed"
  ];
  static const List<Icon> windowsDataIcon = [
    Icon(
      LineIcons.info,
      color: Colors.amber,
    ),
    Icon(
      LineIcons.cogs,
      color: Colors.amber,
    ),
    Icon(
      Icons.note_alt_outlined,
      color: Colors.amber,
    ),
    Icon(
      LineIcons.check,
      color: Colors.amber,
    )
  ];
  static Map windowsData = {
    windowsScreenChips[0]: {
      'imageUrl': 'assets/imgs/windows/slider.jpeg',
      'desc':
          '''Featuring horizontal sashes fitted with rollers at the bottom, these windows optimize space with their swift sideways movement. Easy to open and shut, the slider gives you great ventilation and the widest view possible
          ''',
      'features': {
        'point1': 'High thermal and sound insulation',
        'point2': 'Durable, sturdy, and environment-friendly',
        'point3':
            'Need very little maintenance - Have a naturally strong profile',
        'point4': 'Have a naturally strong profile',
        'point5':
            'Aesthetically-appealing and flexible designs for every setting'
      },
      'recommeded':
          'This window type is ideal for balconies, bedrooms, tall/large openings',
      'availablein': 'UPVC and Aluminium.'
    },
    windowsScreenChips[1]: {
      'imageUrl': 'assets/imgs/windows/casement.jpeg',
      'desc':
          '''Featuring a sash that is hinged from the side on an outer frame that can open inwards and outwards. This ensures maximum ventilation in the room. Due to its double/triple glazing options, they enable better thermal and sound insulation as well. The windows come with multiple points locking systems and friction stay that ensures the window remains open in a fixed position even in the face of a stiff breeze.''',
      'features': {
        'point1': 'Triple sealing',
        'point2': 'Multi-point locking for enhanced security',
        'point3': 'Available in single- and double-glazing options',
        'point4':
            'Drip bar does not allow water inside and insulation against seepage is offered',
      },
      'recommeded':
          'This window type is ideal for kitchen, bedrooms, bathrooms, study rooms, and AC rooms.',
      'availablein': 'UPVC and Aluminium.'
    },
    windowsScreenChips[2]: {
      'imageUrl': 'assets/imgs/windows/tiltandturn.jpeg',
      'desc':
          '''Welcome more sunlight and ventilation inside your home with these Tilt & Turn windows. Featuring a sash that can tilt open at an angle from the top with hinges at the bottom or it can swing inwards with hinges on the side.\n
Advanced engineering facilitates both these operations with the simple turn of a single handle.
          ''',
      'features': {
        'point1': 'Weather resistance and noise insulation',
        'point2': 'Triple sealing',
        'point3': 'Available in contemporary and stylish designs',
        'point4':
            'Tilt position allows rain protection and draft-free ventilation',
        'point5':
            'Turn position offers enhanced ventilation and allows hassle-free cleaning'
      },
      'recommeded':
          'This window type is ideal for kitchen, bedrooms, bathrooms, study rooms, and AC rooms',
      'availablein': 'UPVC and Aluminium.'
    },
    windowsScreenChips[3]: {
      'imageUrl': 'assets/imgs/windows/villa.jpeg',
      'desc':
          '''A rare combination of style and substance, the villa window when launched was the first to introduce a twin sash, bug mesh and a grill built in the system. This ensures enhanced security and ventilation while not allowing insects and mosquitos inside.
          ''',
      'features': {
        'point1': 'Villa windows are energy-efficient',
        'point2': 'Provide insulation from rain, dust, and pollutio',
        'point3':
            'Require very less maintenance - Come equipped with dual seals and a multi-chambered design that helps in preventing noise infiltration and also reduce heat loss',
        'point4':
            'Come equipped with a bug mesh to safeguard your house against insects',
      },
      'recommeded':
          'This window type is ideal for kitchen, bedrooms, bathrooms, study rooms, and AC rooms',
      'availablein': 'UPVC'
    },
    windowsScreenChips[4]: {
      'imageUrl': 'assets/imgs/windows/glasstoglass.jpeg',
      'desc':
          '''Features a fixed window unit, where the glass panes meet at an angle of 90° and are neatly joined together without using any mullions.
          ''',
      'features': {
        'point1': 'Glass to glass corner windows provide a better view',
        'point2':
            'Helps increase the aesthetic value of your house - It allows more light to enter your house which is important for your health',
        'point3':
            'The glass is weather resistant and the window setup is not susceptible to rust',
        'point4':
            'You get a lot of designs and color options in glass to glass corner windows',
      },
      'recommeded': 'Perfect for any corner room of the house',
      'availablein': 'UPVC'
    },
    windowsScreenChips[5]: {
      'imageUrl': 'assets/imgs/windows/combination.jpeg',
      'desc':
          '''A combination window combines casement, fixed, and sliding window designs and is the integration of two windows. It can be of the same type such as casement-casement or different types such as fixed-slider or casement-slider.
          ''',
      'features': {
        'point1':
            'Contain air-tight seals that keep noise, pollution, dust, and heat at bay - Are long-lasting and add to the overall aesthetic appeal of the room',
        'point2': 'Crafted to increase energy efficiency and natural light',
        'point3':
            'Give you a chance to play with different styles, sizes, and shapes',
        'point4':
            'The sill arrangement and rain tracks help with rain insulation.',
      },
      'recommeded':
          'Best suited for High Rise Apartments, Wide/Tall Apertures and Bedrooms',
      'availablein': 'UPVC'
    },
    windowsScreenChips[6]: {
      'imageUrl': 'assets/imgs/windows/fixed.jpeg',
      'desc':
          '''Fixed windows are an imperative part of both residential setups and workplaces. Our uPVC fixed windows are built by utilizing top quality materials and technologies to provide you with the most durable, efficient, and appealing fixed window designs that do justice to all your needs and requirements.
          ''',
      'features': {
        'point1': 'Allows for maximum sunlight to enter',
        'point2':
            'Available in a variety of designs and colours - Help save greatly on energy, making your house energy making your house energy efficient',
        'point3':
            'Keeps out noise, dust, heat, and pollution with the air-tight seals',
        'point4':
            ' Offers superior sound insulation - Protects the house against rainwater seepage and storms',
        'point5':
            'Provides a clear and unhindered view of outside - Also offered in custom sizes'
      },
      'recommeded':
          'Any type of room or architectural style - classic to contemporary',
      'availablein': 'UPVC'
    },
  };

  static const List<String> doorScreenChips = [
    "Slider",
    "Casement",
    "Slide & Fold",
    "Lift & Slide",
    "Designer",
    "Internal",
    "Slimline Slider",
    "90 Degree"
  ];
  static Map doorData = {
    doorScreenChips[0]: {
      'imageUrl': 'assets/imgs/doors/sliding.jpeg',
      'desc':
          '''Featuring horizontal sashes fitted with rollers at the bottom, these windows optimize space with their swift sideways movement. Easy to open and shut, the slider gives you great ventilation and the widest view possible
          ''',
      'features': {
        'point1': 'Offers smooth operation',
        'point2':
            'Superior quality rollers Comes with corrosion-resistant properties',
        'point3': 'Requires very less maintenance',
        'point4':
            'Comprise of hurricane bars to tackle and resist high-speed winds',
        'point5':
            'Come equipped with a bug mesh to safeguard your house against insects'
      },
      'recommeded':
          'Best suited for home interiors, office spaces, bedrooms, balconies, large/tall openings',
      'availablein': 'UPVC and Aluminium.'
    },
    doorScreenChips[1]: {
      'imageUrl': 'assets/imgs/doors/casement.jpeg',
      'desc':
          '''Counted among the most popular door designs, it gives a classic look in even the most modern of settings. Designed to swing inwards or outwards with the twist of a handle, casement doors offer clear views of the other side. Above it's their picturesque profile that makes casement doors the preferred choice for many. Casement Doors are equipped with hook locks and 3D hinges which ensure smooth operation with safety.''',
      'features': {
        'point1': 'Comes with triple sealing to keep seepage at bay',
        'point2': 'Offers resistance from pollution, noise, and dust',
        'point3':
            'Available in single and double glazing options Comes in different design styles',
        'point4': 'Customized designs',
        'point5': 'You can select from low and no threshold variants',
      },
      'recommeded':
          'Works well with bedrooms, kitchen, study rooms, bathrooms, and AC rooms',
      'availablein': 'UPVC and Aluminium.'
    },
    doorScreenChips[2]: {
      'imageUrl': 'assets/imgs/doors/slidefold.jpeg',
      'desc':
          '''Nothing looks or works better in rooms overlooking gardens and terraces. MakeMyWindoor Slide and Fold Door can elegantly and effortlessly connect your inside space with the environment outside. Stylish, contemporary and elegant, they offer a unique slide and fold mechanism that can divide and join large openings effortlessly. Fusion-welded frame and a sash for strength ensure that their beauty stays ageless.''',
      'features': {
        'point1': 'Has submerged threshold',
        'point2':
            'Good weight carrying capacity per sash - Prevents loss of conductive thermal energy',
        'point3': 'Have higher sound insulation properties',
        'point4':
            'Designed with multi-point lock system and high-security hinges',
      },
      'recommeded':
          'Best suited for bedrooms, kitchen, study rooms, bathrooms and AC rooms',
      'availablein': 'UPVC and Aluminium.'
    },
    doorScreenChips[3]: {
      'imageUrl': 'assets/imgs/doors/leftslide.jpeg',
      'desc':
          '''Enjoy vast panoramic views with divider-less glass panes that offer superior insulation and enhanced security. Lift & slide technology can connect inside with outside with just a feather touch.
          ''',
      'features': {
        'point1': 'Comes with heat insulation properties',
        'point2':
            'Robust, aesthetic, and the best choice for weather-resistant doors',
        'point3': 'Designed with child safety mechanism with damper',
        'point4': 'Offers thermal sound insulation',
      },
      'recommeded':
          'Works well with the living room, bedroom, and other home interior spaces.',
      'availablein': 'UPVC and Aluminium (Thermal Break System)'
    },
    doorScreenChips[4]: {
      'imageUrl': 'assets/imgs/doors/designer.jpeg',
      'desc':
          '''MakeMyWindoor is introducing a single door which suits all needs without compromising on performance. The MakeMyWindoor Designer door can be used in your entrance, in rooms, bathrooms, kitchens as well any other area. These doors have insert panel which is having hard skin of UPVC with core filled with foam for high insulation. The Surface can have customized design to have contemporary look. The product is also available with MakeMyWindoor Wood grain finish of Walnut, Light Oak and Mahogany foiled on Al surface with foam core for durability and performance in Indian tropical climate.
          ''',
      'features': {
        'point1': 'Weather endurance: Made for Indian climatic conditions',
        'point2': 'Negligible maintenance - Termite resistance',
        'point3': 'Thermal insulation; Lower energy costs',
      },
      'recommeded': 'Entrance, Rooms, Bathrooms, Kitchens',
      'availablein': 'UPVC and Aluminium (Thermal Break System)'
    },
    doorScreenChips[5]: {
      'imageUrl': 'assets/imgs/doors/internal.jpeg',
      'desc':
          '''MakeMyWindoor doors are made of a special hybrid polymer. They are made from composite materials, replacing traditional material, hence making them environment friendly. MakeMyWindoor doors are resistant to termite, water, moisture absorption, fire and wear & tear of weather. Unlike the old-style traditional doors, MakeMyWindoor doors are low maintenance, superior quality and last longer.
          ''',
      'features': {
        'point1': 'Made of Hybrid Polymers',
        'point2': 'Resistance against Water & Termites',
        'point3': 'Offer Strength and stability - Negligible Maintenance',
        'point4': 'Thermal Insulation',
      },
      'recommeded': 'Bedroom, Bathroom, Kitchen',
      'availablein': 'UPVC'
    },
    doorScreenChips[6]: {
      'imageUrl': 'assets/imgs/doors/slimslider.jpeg',
      'desc':
          '''MakeMyWindoor's range of Slimline Sliding Doors offers minimally visible aluminum sightlines, which maximizes the view you get. With a great balance of functionality and style, these System Aluminium doors add exquisiteness to the façades they are used in.
          ''',
      'features': {
        'point1':
            'Thermal Break profile and double thermal break outer frame offers high energy efficiency - Aluminum frame concealed within the walls, maximizing natural light in the room ',
        'point2':
            'Minimal sightlines of 25mm at interlock and semi-submerged threshold - The special concealed profile section allows for hassle-free ',
        'point3':
            'water drainage - Up to 500 Kg weight capacity offers the possibility of',
        'point4':
            'installing large and special glasses - Options also available in the corner slider',
      },
      'recommeded':
          'Best suited for Bedrooms, Kitchen, Study rooms, Bathrooms, and AC Rooms',
      'availablein': 'Aluminum'
    },
    doorScreenChips[7]: {
      'imageUrl': 'assets/imgs/doors/90degree.jpeg',
      'desc':
          '''Keeping in mind the styles of contemporary homes, MakeMyWindoor introduces the 90 degrees Corner Slider system. It is perfect for use in corners of the balcony, garden spaces, and facades.
          ''',
      'features': {
        'point1': 'Comes with the thermal break system',
        'point2': 'Requires low maintenance',
        'point3': 'The doors are extremely energy efficient',
        'point4':
            'Helps in minimizing thermal losses - Keeps pollution, dust, and noise at bay',
      },
      'recommeded':
          'Works well with garden entry, balconies at 90 degrees, large/tall openings',
      'availablein': 'UPVC and Aluminium (Thermal Break System)'
    }
  };
}
