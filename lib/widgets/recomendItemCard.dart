import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/screens/onBoarding/ItemPage.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/generalCard.dart';

class RecomendedItemCard extends StatefulWidget {
  final String firstlineText;
  final String secondLineText;
  final num amount;
  final String? imagePath;
  final Function()? onTap;
  final Function()? onTapAdd;

  const RecomendedItemCard(
      {super.key,
      required this.firstlineText,
      required this.secondLineText,
      required this.amount,
      this.imagePath,
      this.onTap,
      this.onTapAdd});

  @override
  State<RecomendedItemCard> createState() => _RecomendedItemCardState();
}

class _RecomendedItemCardState extends State<RecomendedItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: GeneralCard(
        onTap: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemView(itemIndex: itemIndex),
              ),
            );
          });
        },
        cardColor: AppColors.black1,
        cardRadius: 12,
        height: 194,
        width: 128,
        children: [
          Expanded(
            child: Image.asset(widget.imagePath ?? AppImagesPath.Cart),
          )
          // Image(
          //   height: 56.67,
          //   width: 56.67,
          //   image: Svg(AppImagesPath.imageIcon, color: AppColors.black),
          // ),
          ,
          Image(
            image: Svg(AppImagesPath.lineIcon2),
            color: AppColors.lineIcon3Color,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.firstlineText,
                  style: itemCardfirstlineStyle,
                ),
                Text(
                  widget.secondLineText,
                  style: itemCardSecondlineStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: -1,
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                color: AppColors.whiteText,
              ),
              // height: 1,
              width: 108,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  Text(
                    "Unit",
                    style: itemCardUnitStyle,
                  ),
                  Spacer(),
                  Text(
                    "\$ ${widget.amount}",
                    style: itemCardAmountStyle,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: widget.onTapAdd,
                    child: Icon(
                      Icons.add_circle,
                      color: AppColors.appBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
