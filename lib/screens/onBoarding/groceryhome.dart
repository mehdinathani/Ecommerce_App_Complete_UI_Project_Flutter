import 'package:flutter/material.dart';
import 'package:uimehdinathani/screens/onBoarding/recomendedtab.dart';
import 'package:uimehdinathani/widgets/topBarBackground.dart';
import '../../widgets/customBanner.dart';
import 'dealspage.dart';

class GroceryHome extends StatefulWidget {
  const GroceryHome({super.key});

  @override
  State<GroceryHome> createState() => _GroceryHomeState();
}

class _GroceryHomeState extends State<GroceryHome> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TopBarBackground(
              showCustomBackButton: false,
              isgreet: true,
              username: "Mehdi",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomBannerSlidding(),
                    RecomendedTab(),
                    DealsView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
