import 'package:flutter/material.dart';
import 'package:uimehdinathani/styles/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pop();
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
