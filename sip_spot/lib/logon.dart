import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sip_spot/fressery.dart';
import 'package:sip_spot/registration.dart';

class Loginpage1 extends StatefulWidget {
  const Loginpage1({super.key});

  @override
  State<Loginpage1> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage1> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 400,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/Screenshot 2025-02-21 143132.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromRGBO(170, 116, 116, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(196, 135, 198, 1),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: password,
                            obscureText: true, // ✅ Hide password input
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      _registerUser();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(218, 217, 8, 8),
                      shadowColor: Colors.black45,
                      elevation: 5, // Adds shadow
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: Text(
                      '         LOGIN        ',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Divider(),
                  SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      //
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registration()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(218, 217, 8, 8),
                      shadowColor: Colors.black45,
                      elevation: 5, // Adds shadow
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: Text(
                      'REGISTER NOW',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create New Account",
                        style: TextStyle(
                          color: Color.fromRGBO(148, 144, 159, 1),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: const Color.fromRGBO(148, 144, 159, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dio _dio = Dio();
  var _message = "";

  Future<void> _registerUser() async {
    print("Starting login process...");

    const String url =
        "https://fressery.b4production.com/index.php?route=api/login";

    FormData formData = FormData.fromMap({
      "email": email.text,
      "password": password.text,
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
    sharedPreferences.setString("key",tkn);
    print("❤️❤️❤️❤️❤️❤️❤️❤️❤️$tkn");
   
    // textcon.text = sharedPreferences.getString("key")!;
  }
  
}
