import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:makemywindoor/widgets/my_button.dart';
import 'package:makemywindoor/widgets/my_textfield.dart';
import 'package:makemywindoor/models/contacts_us.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: SizeConfig.blockSizeVertical * 35,
                  child: Lottie.asset(
                    'assets/imgs/lotties/76817-contact-us.json',
                    fit: BoxFit.contain,
                  ),
                ),
                MyTextFormField(
                  label: "Name",
                  icon: LineIcons.user,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    helpsupport.name = value!;
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 24.0),
                MyTextFormField(
                  label: "Mobile Number",
                  icon: LineIcons.user,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    helpsupport.phone = value!;
                  },
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 24.0),
                MyTextFormField(
                  label: "Email",
                  icon: LineIcons.envelope,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    helpsupport.email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24.0),
                MyTextFormField(
                  label: "Message",
                  icon: LineIcons.envelope,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    helpsupport.query = value!;
                  },
                  keyboardType: TextInputType.multiline,
                  lines: 3,
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.0, 1.0],
                        colors: [
                          Colors.amber[700]!,
                          Colors.amber[700]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: MyButton(
                      title: 'Send',
                      onPressed: onPressedFunction,
                      // widthx: SizeConfig.blockSizeHorizontal * 100,
                      // heightX: SizeConfig.blockSizeVertical * 6.5,
                      // colorx: Colors.transparent,
                      // radiusX: 5.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late ContactUsModel helpsupport;

  onPressedFunction() async {
    if (_formKey.currentState!.validate()) {
      helpsupport = ContactUsModel();
      _formKey.currentState!.save();

      //
      launchWhatsApp();

      _formKey.currentState!.reset();
      FocusScope.of(context).unfocus();
    }
  }

  void launchWhatsApp() async {
    String whatsappText =
        "Hello Make My Windoor,\n\nName: ${helpsupport.name}\nNumber: ${helpsupport.phone}\nEmail: ${helpsupport.email}\n\nMessage: ${helpsupport.query}.\n\nI would Like to talk to you regarding order.";
    String uri =
        'https://wa.me/+918041246348?text=${Uri.encodeComponent(whatsappText)}';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch';
    }
  }
}
