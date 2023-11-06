import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pfps_platform/Screen/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFPS_PLATFORM',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.asset("assets/images/kbu.png"),
          splashIconSize: 700,
          duration: 3000,
          nextScreen: MainScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
