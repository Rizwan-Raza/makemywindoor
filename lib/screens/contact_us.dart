import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mailer2/mailer.dart';
import 'package:makemywindoor/helperwidgets/my_button.dart';
import 'package:makemywindoor/helperwidgets/my_textfield.dart';
import 'package:makemywindoor/model/contacts_us.dart';
import 'package:makemywindoor/utils/color_generator.dart';
import 'package:makemywindoor/utils/my_constants.dart';
import 'package:makemywindoor/utils/size_config.dart';

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
                // helpSupportInput(
                //   0,
                //   'Name ',
                //   'Name',
                //   'Name is Required.',
                //   '',
                //   TextInputType.name,
                //   1,
                // ),
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

                // helpSupportInput(
                //   1,
                //   'Mobile Number ',
                //   'Mobile Number',
                //   'Mobile Number is Required.',
                //   '',
                //   TextInputType.number,
                //   1,
                // ),
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

                // helpSupportInput(
                //   2,
                //   'Email ',
                //   'Email ',
                //   'Email is Required.',
                //   '',
                //   TextInputType.emailAddress,
                //   1,
                // ),
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

                // helpSupportInput(
                //   3,
                //   'Drop Your Query ',
                //   'Drop Your Query',
                //   'Just drop your query...',
                //   '',
                //   TextInputType.text,
                //   6,
                // ),
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

  Widget helpSupportInput(
      int type,
      String labelText,
      String hintText,
      String errorText,
      String suffixText,
      TextInputType keyboardType,
      int maxlines
      // TextEditingController _controlller,
      ) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        // scrollPadding: EdgeInsets.zero,
        // keyboardAppearance: ,
        autofocus: false,
        // controller: _controlller,
        keyboardType: keyboardType,

        // onChanged: _serachContact,
        onTap: () async {},
        // onChanged: ,
        validator: (value) {
          switch (type) {
            case 0:
              if (value!.isEmpty) {
                return errorText;
              }
              // else if (_controlller.text.length != 10) {
              //   return 'Customer ID must be of 10 digit.';
              // }
              break;
            case 1:
              if (value!.isEmpty) {
                return errorText;
              }
              break;
            case 2:
              if (value!.isEmpty) {
                return errorText;
              }
              break;
            case 3:
              if (value!.isEmpty) {
                return errorText;
              }
              break;
          }

          return null;
        },
        onSaved: (value) {
          switch (type) {
            case 0:
              helpsupport.name = value!;
              break;
            case 1:
              helpsupport.phone = value!;
              break;
            case 2:
              helpsupport.email = value!;
              break;
            case 3:
              helpsupport.query = value!;
              break;
          }
          print('value! is going to be save =========' + value!);
        },
        style: MyConstants.rechareBillPaymentHeaderStyle,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,

        maxLines: maxlines,

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorCodeGen.colorFromHex('#000000')),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorCodeGen.colorFromHex('#000000')),
          ),
          // border: new OutlineInputBorder(
          //     borderSide: new BorderSide(color: Colors.teal)),
          suffixIcon: GestureDetector(
            child: Text(
              suffixText,
              style: MyConstants.moduleNameStyle
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          helperText: '',
          hintText: hintText,
          labelStyle: MyConstants.rechareBillPaymentHeaderStyle
              .copyWith(fontSize: 14, color: Colors.grey),
          helperStyle: MyConstants.rechareBillPaymentHeaderStyle
              .copyWith(fontSize: 14, color: Colors.grey),
          hintStyle: MyConstants.rechareBillPaymentHeaderStyle
              .copyWith(fontSize: 12, color: Colors.grey),
          // errorText: type == 0 ? _errorText : _errorText1,
          helperMaxLines: 2,
          suffixIconConstraints:
              const BoxConstraints(minHeight: 24, minWidth: 24),
          // contentPadding: EdgeInsets.all(0),
          labelText: labelText,
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  late ContactUsModel helpsupport;
  onPressedFunction() async {
    if (_formKey.currentState!.validate()) {
      helpsupport = ContactUsModel();
      _formKey.currentState!.save();

      showLoadingDialog();
      sendMail(
          subject:
              'glidefares : Thank you for your valuable time. We will get back to you within 24hr.',
          toMail: helpsupport.email);
      sendMail(
          subject: 'Query for glidefares', toMail: MyConstants.companyEmail);
      // _formKey.currentState
      FocusScope.of(context).unfocus();
    }
  }

  sendMail({
    String? subject,
    String? toMail,
  }) async {
    // showLoader(true);
    // _handleSubmit(context);
    log(subject.toString());
    log(toMail.toString());

    var options = SmtpOptions()
      ..hostName = 'mail.makemywindoor.com'
      ..port = 25
      ..username = MyConstants.companyEmail
      ..password = MyConstants.companyEmail;

    var emailTransport = SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = Envelope()
      ..from = MyConstants.companyEmail
      ..recipients.add('$toMail')
      ..subject = '$subject'
      ..html = '<table width="571" border="0" align="center" cellpadding="0" cellspacing="0" style="font-family:Arial, Helvetica, sans-serif; font-size:14px;"><tbody><tr><td><table width="100%" border="0" cellspacing="0" cellpadding="10"><tbody><tr><td bgcolor="#EFF3F8"><a href="https://www.adivaha.com/panal/email-viewers.php?mailer_id={mailer_id}&amp;cust_id={cust_id}&amp;title=Feedback-Emailer&amp;ref=https://www.glidefares.com/"><img src="https://www.glidefares.com/img/graylogo.png" border="0"></a></td>' +
          '</tr></tbody></table></td></tr><tr><td style="padding:10px; background:#EFF3F8;"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td bgcolor="#E1E6EC"><table width="100%" border="0" cellspacing="0" cellpadding="0">' +
          '<tbody><tr><td style="border-top:#0C0 5px solid;">&nbsp;</td><td style="border-top:#36C 5px solid;">&nbsp;</td><td style="border-top:#F90 5px solid;">&nbsp;</td><td style="border-top:#F00 5px solid;">&nbsp;</td><td style="border-top:#F0C 5px solid;">&nbsp;</td></tr></tbody></table></td></tr><tr><td bgcolor="#E1E6EC">&nbsp;</td></tr><tr><td align="center" bgcolor="#E1E6EC" style="font-size:30px; padding-bottom:10px; font-weight:bold;">Contact Us</td></tr><tr><td bgcolor="#FFFFFF">&nbsp;</td></tr><tr>' +
          '<td bgcolor="#FFFFFF"><table width="60%" border="1" align="center" cellpadding="5" cellspacing="0" style="font-size:13px;" bordercolor="#BFFFD5"><tbody><tr><td width="36%">Name</td><td width="64%">${helpsupport.name}</td></tr><tr><td>Email</td><td>${helpsupport.email}</td></tr><tr><td>Ph. No.</td><td>${helpsupport.phone}</td></tr><tr><td>Query</td><td>${helpsupport.query}</td></tr>' +
          '</tbody></table></td></tr><tr><td bgcolor="#FFFFFF">&nbsp;</td></tr></tbody></table></td></tr><tr><td bgcolor="#FFFFFF">&nbsp;</td></tr><tr><td align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td align="center">glidefares</td></tr><tr><td>&nbsp;</td></tr></tbody></table></td></tr><tr><td align="center" bgcolor="#FFFFFF">Contact Us : info@glidefares.com,${MyConstants.companyEmail}</td></tr><tr><td bgcolor="#FFFFFF">&nbsp;</td></tr><tr>' +
          '<td align="center" bgcolor="#FFFFFF"><img src="https://www.glidefares.com/img/graylogo.png" width="234" height="35"></td></tr><tr><td align="center" bgcolor="#FFFFFF">&nbsp;</td></tr></tbody></table>';

    // Email it.
    emailTransport.send(envelope).then((envelope) {
      log('sending : $envelope');
      // showLoader(false);
      if (_keyLoader.currentContext != null) {
        Navigator.of(_keyLoader.currentContext!).pop();
      }
      Fluttertoast.showToast(
          msg:
              'Your Query has been sent successfully. Kindly check your mail.');

      _formKey.currentState!.reset();
    }).catchError((e) {
      if (_keyLoader.currentContext != null) {
        Navigator.of(_keyLoader.currentContext!).pop();
      }
      Fluttertoast.showToast(msg: 'Server Error');
      log('Error occurred: $e');
    });
  }

  showLoadingDialog() {
    return showDialog<Widget>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: _keyLoader,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Row(children: [
                        const Expanded(
                          child: SizedBox(),
                        ),
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              ColorCodeGen.colorFromHex('#E53E8E')),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        const Text(
                          "Sending query, Please wait ...",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                      ]),
                    )
                  ]));
        });
  }
}
