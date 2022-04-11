import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gre_vocab/HomePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      child: AnimatedSplashScreen(
        splashIconSize: 400,
          splash: Image.asset("images/splashscreen.png",
          ),
          duration: 1500,
          backgroundColor: Colors.deepOrange,
          splashTransition: SplashTransition.scaleTransition,
          nextScreen: HomePage()
      ),
    );
  }
}
