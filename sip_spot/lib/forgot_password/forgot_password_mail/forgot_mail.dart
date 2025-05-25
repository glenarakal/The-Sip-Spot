import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(home: SendOtpPage()));

class SendOtpPage extends StatefulWidget {
  @override
  _SendOtpPageState createState() => _SendOtpPageState();
}

class _SendOtpPageState extends State<SendOtpPage> {
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  String screen = "email"; // toggle state

  Future<void> sendOTP() async {
    final res = await http.post(
      Uri.parse(
        'http://10.0.2.2:5000/send-otp',
      ), // use 10.0.2.2 for Android emulator
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': emailController.text}),
    );
    if (res.statusCode == 200) {
      setState(() => screen = 'otp');
    }
  }

  Future<void> verifyOTP() async {
    final res = await http.post(
      Uri.parse('http://10.0.2.2:5000/verify-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': emailController.text,
        'otp': otpController.text,
      }),
    );
    final data = jsonDecode(res.body);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(data['message'] ?? 'Failed')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mail Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: screen == "email"
            ? Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  ElevatedButton(onPressed: sendOTP, child: Text('Send OTP')),
                ],
              )
            : Column(
                children: [
                  Text("OTP sent to ${emailController.text}"),
                  TextField(
                    controller: otpController,
                    decoration: InputDecoration(labelText: 'Enter OTP'),
                  ),
                  ElevatedButton(
                    onPressed: verifyOTP,
                    child: Text('Verify OTP'),
                  ),
                ],
              ),
      ),
    );
  }
}
