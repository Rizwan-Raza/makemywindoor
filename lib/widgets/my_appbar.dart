import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String title;
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backwardsCompatibility: true,

      elevation: 0,
      // automaticallyImplyLeading: false,
      title: title.isNotEmpty
          ? Text(
              title,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            )
          : Center(
              child: SizedBox(
                  height: 40,
                  child: Image.asset(
                    "assets/imgs/logo.png",
                    gaplessPlayback: true,
                  ))),
      centerTitle: true,
    );
  }
}
