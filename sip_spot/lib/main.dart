import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';


import 'package:sip_spot/firebase_options.dart';
import 'package:sip_spot/intro.dart';
import 'package:sip_spot/mixjuices.dart';
import 'package:sip_spot/plainjuices.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Sip Spot',

      initialRoute: '/',

      locale: Locale('en', 'US'),

      supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],

      fallbackLocale: Locale('en', 'US'),

      debugShowCheckedModeBanner: false,

      defaultTransition: Transition.leftToRightWithFade,

      transitionDuration: const Duration(milliseconds: 500),
      home: Intro()
      
    );
  }
}
