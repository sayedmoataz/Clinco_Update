



import 'package:flutter/material.dart';
import 'package:new_clinco/Modules/Home_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const HomePageScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/logo/clinico_logo.png",
      text: "Clinco",
      textType: TextType.ScaleAnimatedText,
      textStyle: const TextStyle(fontSize: 30.0),
      backgroundColor: Colors.white,
    );
  }
}
