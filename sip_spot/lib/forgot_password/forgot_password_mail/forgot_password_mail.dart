import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip_spot/constants/sizes.dart';
import 'package:sip_spot/forgot_password/forgot_password_otp/otp_screen.dart';

class ForgotPasswordMail extends StatelessWidget {
  const ForgotPasswordMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/yellow_illustraions.svg',
                height: 250,
              ),
              Text(
                "Forgot Password",
                style: GoogleFonts.aDLaMDisplay(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(tForgetEmailSubtitle),

              SizedBox(height: 40),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("E-mail"),
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Slightly rounded corners
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

