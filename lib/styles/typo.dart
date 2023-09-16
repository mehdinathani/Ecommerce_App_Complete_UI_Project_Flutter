import 'package:flutter/material.dart';
import 'package:uimehdinathani/styles/colors.dart';

class CustomTextStyle {
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  CustomTextStyle({
    this.textColor,
    this.fontWeight,
    this.fontSize,
  });

  static TextStyle toTextStyle(CustomTextStyle? customTextStyle) {
    return TextStyle(
      color: customTextStyle?.textColor,
      fontWeight: customTextStyle?.fontWeight,
      fontSize: customTextStyle?.fontSize,
    );
  }
}

TextStyle h1style = CustomTextStyle.toTextStyle(CustomTextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 30,
  textColor: AppColors.getstartedbuttonColor,
));

TextStyle h4style = CustomTextStyle.toTextStyle(CustomTextStyle(
    fontWeight: FontWeight.bold, fontSize: 18, textColor: AppColors.h4color));

TextStyle usernamestyle = CustomTextStyle.toTextStyle(CustomTextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 22,
  textColor: AppColors.black1,
));

TextStyle searchFieldHintTextStyle =
    CustomTextStyle.toTextStyle(CustomTextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  textColor: AppColors.searchFieldHintTextColor,
));

TextStyle appBarlastSubheadingStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w800,
    textColor: AppColors.black1,
  ),
);

TextStyle appBarlastHeadingStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    textColor: AppColors.black1,
  ),
);

TextStyle bannerFirststringStyle = CustomTextStyle.toTextStyle(CustomTextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w300,
  textColor: AppColors.black1,
));

TextStyle bannerSecondStringStyle = CustomTextStyle.toTextStyle(CustomTextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w800,
  textColor: AppColors.black1,
));

TextStyle bannerThirdStringStyle = CustomTextStyle.toTextStyle(CustomTextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w500,
  textColor: AppColors.black1,
));

TextStyle recommendedStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    textColor: AppColors.getstartedTextColor,
  ),
);

TextStyle itemCardfirstlineStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, textColor: AppColors.black),
);

TextStyle itemCardSecondlineStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    textColor: AppColors.itemCardSecondlineColor,
  ),
);
TextStyle itemCardUnitStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      textColor: AppColors.searchFieldHintTextColor),
);

TextStyle itemCardAmountStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      textColor: AppColors.amountColor),
);

TextStyle topBarFirstHeadingStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
      fontSize: 50,
      fontWeight: FontWeight.w300,
      textColor: AppColors.getstartedbuttonColor),
);

TextStyle topBarSecondHeadingStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
      fontSize: 50,
      fontWeight: FontWeight.w800,
      textColor: AppColors.getstartedbuttonColor),
);

TextStyle choiceChiptagsStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      textColor: AppColors.amountColor),
);

TextStyle productNameHeadingStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      textColor: AppColors.amountColor),
);

TextStyle productDetailTitleStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    textColor: AppColors.black,
  ),
);

TextStyle productPriceStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    textColor: AppColors.blueText,
  ),
);

TextStyle productKGStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    textColor: AppColors.blueText,
  ),
);

TextStyle productDiscountPriceStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    textColor: AppColors.getstartedbuttonColor,
  ),
);

TextStyle productRegPriceStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    textColor: AppColors.h4color,
  ),
);

TextStyle reviewsCountStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    textColor: AppColors.reviewsCountColor,
  ),
);

TextStyle itemButton1TextStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    textColor: AppColors.blue2,
  ),
);

TextStyle itemButton2TextStyle = CustomTextStyle.toTextStyle(
  CustomTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    textColor: AppColors.whiteText,
  ),
);
