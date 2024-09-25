import 'package:flutter/material.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/topbarGeneral.dart';

class TopBarCategory extends StatefulWidget {
  const TopBarCategory({super.key});

  @override
  State<TopBarCategory> createState() => _TopBarCategoryState();
}

class _TopBarCategoryState extends State<TopBarCategory> {
  @override
  Widget build(BuildContext context) {
    return GeneralTopBar(
      showCustomBackButton: true,
      isgreet: true,
      username: "Mehdi",
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Shop",
            style: topBarFirstHeadingStyle,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "By Category",
            style: topBarSecondHeadingStyle,
          ),
        )
      ],
    );
  }
}
