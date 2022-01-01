import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:makemywindoor/utils/size_config.dart';

class LottiImageHelperWidget extends StatelessWidget {
  final String lottiImageurl;
  // ignore: use_key_in_widget_constructors
  const LottiImageHelperWidget({required this.lottiImageurl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 30,
      height: SizeConfig.blockSizeVertical * 15,
      child: Lottie.asset(
        'assets/covid_icons/' + lottiImageurl + '.json',
        fit: BoxFit.contain,
      ),
    );
  }
}
