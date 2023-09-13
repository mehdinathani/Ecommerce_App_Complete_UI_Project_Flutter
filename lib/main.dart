import 'package:flutter/material.dart';
import 'package:uimehdinathani/screens/onBoarding/ItemPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Manrope"),
      home: ItemView(
        itemIndex: 4,
      ),
    );
  }
}
