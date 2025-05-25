import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sip_spot/logon.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final formKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  int selectedindex = 0;
  bool _obscureText = true;

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: -60,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/registration1.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Create Account",
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003049),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // Registration Form Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12,
                        color: Colors.black12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: firstnameController,
                          label: "First Name",
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: lastnamecontroller,
                          label: "Last Name",
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: emailController,
                          label: "Email",
                          icon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Enter your email';
                            if (!value.contains('@'))
                              return 'Enter valid email';
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: mobileController,
                          label: "Mobile Number",
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Enter your mobile number';
                            if (value.length != 10) return 'Must be 10 digits';
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: _togglePassword,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Enter your password';
                            if (value.length < 6)
                              return 'At least 6 characters';
                            return null;
                          },
                        ),

                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _registerUser();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 5,
                            ),
                            backgroundColor: const Color(0xFF003049),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Register Now",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "OR",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 10),

                        OutlinedButton.icon(
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Color(0xFFDB4437),
                          ),
                          onPressed: () {
                            // Google sign-in logic
                          },
                          label: const Text(
                            "Continue with Google",
                            style: TextStyle(color: Color(0xFF003049)),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(color: Color(0xFF003049)),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 5,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginpage1(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.poppins(color: Colors.black87),
                              children: [
                                TextSpan(
                                  text: "Login Here",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF003049),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) return 'Please enter $label';
            return null;
          },
    );
  }

  Dio _dio = Dio();
  var _message = "";
  Future<void> _registerUser() async {
    print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
    const String url =
        "https://fressery.b4production.com/index.php?route=api/register";

    // Creating FormData
    FormData formData = FormData.fromMap({
      'firstname': firstnameController.text,
      'lastname': lastnamecontroller.text,
      'email': emailController.text,
      'password': passwordController.text,
      'telephone': mobileController.text,
      'newsletter': "",
    });

    try {
      Response response = await _dio.post(url, data: formData);
      print("hhhhhhhhhhhhhhhhhhhhhhhh${response.data}");
      if (response.data["success"] == "text_success") {
        setState(() {
          _message = response.data["message"] ?? "Registration Successful!";
        });
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(_message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage1()),
                    );
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _message = "Error: ${response.data['error']['email']}";
        });

        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(_message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      setState(() {
        _message = "Failed to register. Please try again.";
      });

      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(_message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      print("Exception: $e");
    }
  }
}
