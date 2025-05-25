import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip_spot/constants/sizes.dart';

class ForgotPasswordPhone extends StatelessWidget {
  const ForgotPasswordPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/yellow_illustraions.svg',
              height: 200,
            ),
            Text(
              "Forgot Password",
              style: GoogleFonts.aDLaMDisplay(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(tForgetPhoneSubTitle),

            SizedBox(height: 40),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Phone"),
                      hintText: "Phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Your action here
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
    );
  }
}
