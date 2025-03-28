import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sip_spot/registration.dart';




class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return
    
    AnimatedSplashScreen(
       splash: 
       Wrap(
         children:[ Column(
           mainAxisAlignment: MainAxisAlignment.start,
         children: [
          FittedBox(
               fit: BoxFit.cover,
               child: 
               Text('''The\n   Sip\n      Spot''',
             
                            style: 
                            GoogleFonts.lemon(
               textStyle: TextStyle(color: const Color.fromRGBO(247, 246, 248, 1),
                   fontSize: 50,
                      fontWeight:FontWeight.bold
                      ),
                       ),
                           ),
             ),
             SizedBox(height: 20,),
            
             Text("Refreshing Every Sip!",
             textAlign: TextAlign.center,
               style: GoogleFonts.lato(textStyle: TextStyle(
                 color: Colors.white70,
                  
                 fontSize: 18
               ),))
         ],
             ),
         ]
       ),
     nextScreen: Registration(),
     duration: 1,
    splashTransition: SplashTransition.decoratedBoxTransition,
    backgroundColor: const Color.fromARGB(221, 144, 127, 153),);
  }
}