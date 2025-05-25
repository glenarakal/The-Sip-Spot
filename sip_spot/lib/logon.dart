import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sip_spot/constants/sizes.dart';
import 'package:sip_spot/forgot_password/forgot_password_options/forget_password_modal_bottom_sheet.dart';
import 'package:sip_spot/forgot_password/forgot_password_options/fotrgot_password_btn_widgte.dart';
import 'package:sip_spot/fressery.dart';
import 'package:sip_spot/registration.dart';

class Loginpage1 extends StatefulWidget {
  const Loginpage1({super.key});

  @override
  State<Loginpage1> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage1> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true; // Password initially hidden

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText; // Toggle visibility
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              Column(
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
                    "Welcome Back",
                    style: GoogleFonts.roboto(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003049),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

                  /// Email Field
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter your email';
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  /// Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.fingerprint),
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: _togglePassword,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter your password';
                      if (value.length < 6)
                        return 'Password must be at least 6 characters';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

                  /// Forgot Password Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => BuildShowModalBottomSheet(context),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color.fromARGB(221, 128, 150, 161),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Login Button
                  ElevatedButton(
                    onPressed: () {
                      // _registerUser();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Fressery()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003049),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 6,
                    ),
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  /// OR divider
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 20),

                  /// Google Sign-In Button
                  OutlinedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Color(0xFF003049),
                    ),
                    onPressed: () {
                      // Handle Google Sign-In
                    },
                    label: Text(
                      "Sign in with Google",
                      style: TextStyle(color: Color(0xFF003049)),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(color: Color(0xFF003049)),
                    ),
                  ),
                  SizedBox(height: 20),

                  /// Register Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Registration()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003049),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 6,
                    ),
                    child: Text(
                      'REGISTER',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  /// Footer Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Color.fromRGBO(148, 144, 159, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Registration(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xFF003049),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Dio _dio = Dio();
  var _message = "";

  Future<void> _registerUser() async {
    const String url =
        "https://fressery.b4production.com/index.php?route=api/login";

    FormData formData = FormData.fromMap({
      "email": emailController.text,
      "password": passwordController.text,
    });

    try {
      Response response = await _dio.post(url, data: formData);
      print("API Response: ${response.data}");

      if (response.data['success'] == "Login successful!") {
        setState(() {
          _message = response.data["message"] ?? "Login Successful!";
          savevalue(response.data['token']);
        });

        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(_message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Fressery()),
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
          _message = "Error: ${response.data}";
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

  void savevalue(var tkn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("key", tkn);
    print("❤️❤️❤️❤️❤️❤️❤️❤️❤️$tkn");

    // textcon.text = sharedPreferences.getString("key")!;
  }
}
