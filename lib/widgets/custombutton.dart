import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final FontWeight? fontWeight;
  final double? fontsize;
  final IconData? buttonIcon;
  final double? iconSize;
  final double? mediaWidth;
  final double? mediaHeight;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.textColor,
    this.buttonColor,
    this.fontWeight,
    this.fontsize,
    this.buttonIcon,
    this.iconSize,
    this.mediaWidth,
    this.mediaHeight,
  });

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;

    return Container(
      width: mediaWidth * 0.55,
      height: mediaHeight * 0.12,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: buttonColor ?? AppColors.blue1,
      ),
      child: MaterialButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: fontsize ?? 16,
                  color: textColor ?? AppColors.whiteText,
                  fontWeight: fontWeight ?? FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Icon(
                buttonIcon,
                size: iconSize,
              )
            ],
          )),
    );
  }
}
