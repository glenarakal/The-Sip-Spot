import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  final confirmPasswordController = TextEditingController();

  int selectedindex = 0;

  final player = AudioPlayer();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,

        selectedItemColor: const Color.fromARGB(255, 4, 62, 222),
        unselectedItemColor: const Color.fromARGB(255, 10, 5, 5),
        backgroundColor: const Color.fromARGB(255, 247, 248, 247),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),

          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Phone"),
        ],
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 186, 26, 26),
        elevation: 0, // Remove shadow for a clean look
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center everything
          children: [
            SizedBox(width: 10), // Space between logo and text
            Text(
              "Create Account",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 10, 10, 10),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            height: 600,
            width: 500,
            color: const Color.fromARGB(41, 238, 246, 244),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: firstnameController,
                        decoration: InputDecoration(
                          labelText: 'First-Name',
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: const Color.fromARGB(255, 1, 1, 3),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      TextFormField(
                        controller: lastnamecontroller,
                        decoration: InputDecoration(
                          labelText: 'Last-Name',
                          prefixIcon: Icon(Icons.person_2_outlined),
                          prefixIconColor: const Color.fromARGB(255, 4, 4, 13),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          prefixIconColor: const Color.fromARGB(255, 2, 2, 7),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: mobileController,
                        decoration: InputDecoration(
                          labelText: 'Mobile',
                          prefixIcon: Icon(Icons.phone_android_outlined),
                          prefixIconColor: const Color.fromARGB(255, 2, 2, 5),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          if (value.length != 10) {
                            return 'Mobile number must be 10 digits';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_open_outlined),
                          prefixIconColor: const Color.fromARGB(255, 2, 2, 4),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Re-enter Password',
                          prefixIcon: Icon(Icons.lock_outline_sharp),
                          prefixIconColor: const Color.fromARGB(255, 6, 6, 14),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please re-enter your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          _registerUser();

                          // playSound();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Loginpage1(),
                          //   ),
                          // );
                        },
                        child: Text(
                          'Register Now',
                          style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 13, 13, 12),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
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
                            text: "Already have an account?   ",
                            style: GoogleFonts.roboto(color: Colors.black87),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'LOGIN HERE',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 1, 1, 15),
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
          ),
        ),
      ),
    );
  }

  Future<void> playSound() async {
    String audioPath = "sounds/menus.mp3";
    await player.play(AssetSource(audioPath));
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
