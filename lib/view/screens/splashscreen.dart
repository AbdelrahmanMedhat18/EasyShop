import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:handling/view/screens/welcome.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSplashScreen(
            animationDuration: const Duration(
                milliseconds: 1000,
            ),
            // backgroundColor: Colors.blueAccent,
            duration: 2000,
            splashIconSize: 300,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            splash: Image.asset("assets/images/appstore.png"),
            nextScreen: const WelcomeScreen(),
          ),
          Container(
            margin: EdgeInsets.only(top: 350),
              child: Text(
                "Easy Shop",
                style: TextStyle(
                 fontSize: 30,
                 fontWeight: FontWeight.bold,
                ),
              ),
          ),
        ],
      ),
    );
  }
}
