import 'package:flutter/material.dart';
import 'package:uimehdinathani/screens/onBoarding/groceryhome.dart';
import 'package:uimehdinathani/styles/colors.dart';

class CustomBackButtonHome extends StatelessWidget {
  const CustomBackButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GroceryHome(),
            ),
          );
        },
        child: CircleAvatar(
          backgroundColor: AppColors.black45,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
          ),
        ));
  }
}
