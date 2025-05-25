import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:sip_spot/constants/sizes.dart';
import 'package:sip_spot/forgot_password/forgot_password_mail/forgot_mail.dart';
import 'package:sip_spot/forgot_password/forgot_password_mail/forgot_password_mail.dart';
import 'package:sip_spot/forgot_password/forgot_password_mail/forgot_password_phone.dart';
import 'package:sip_spot/forgot_password/forgot_password_options/fotrgot_password_btn_widgte.dart';

Future<dynamic> BuildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(20),
    ),
    builder: (context) => Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tForgetPasswordTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            tForgetPasswordSubtitle,
            style: GoogleFonts.aDLaMDisplay(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 30.0),

          forgot_password_widget(
            btnIcon: Icons.mail_outline_rounded,
            title: "Email",
            subtitle: tResetViaEmail,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordMail()));
            },
          ),
          SizedBox(height: 20.0),
          forgot_password_widget(
            btnIcon: Icons.phone_android_outlined,
            title: "Phone",
            subtitle: tResetViaPhone,
            onTap: () {
                 Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPasswordPhone()),
              );
            },
          ),
        ],
      ),
    ),
  );
}
