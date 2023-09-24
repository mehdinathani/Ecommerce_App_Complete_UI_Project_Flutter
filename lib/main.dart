import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/screens/onBoarding/cart_View.dart';
import 'package:uimehdinathani/screens/onBoarding/onboardingviewv02.dart';
import 'package:uimehdinathani/widgets/cartItems_tiles.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Manrope"),
          home: const OnBoardingView()),
    );
  }
}
