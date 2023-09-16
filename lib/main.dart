import 'package:flutter/material.dart';
import 'package:uimehdinathani/screens/onBoarding/onboardingviewv02.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Manrope"),
        home: OnBoardingView());
  }
}
