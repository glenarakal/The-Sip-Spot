import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip_spot/constants/sizes.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            ),
            Text(tOtpSubTitle.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            ),
            SizedBox(height: 40.0,),
            Text("$tOtpMessage glen.arakal0007@gmail.com",textAlign: TextAlign.center,),
            SizedBox(height: 20.0,),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code){print("OTP is => $code");},
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20,),
            SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: (){},
               child: Text("Next")),
            )
          ],
        ),
      ),
    );
  }
}
