import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/generalCard.dart';

class DealsIteamCard extends StatefulWidget {
  final num amount;
  final String textdata;
  final String? imagepath;
  const DealsIteamCard(
      {super.key,
      required this.amount,
      required this.textdata,
      this.imagepath});

  @override
  State<DealsIteamCard> createState() => _DealsIteamCardState();
}

class _DealsIteamCardState extends State<DealsIteamCard> {
  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      cardColor: AppColors.black1,
      cardRadius: 12,
      height: 194,
      width: 167,
      children: [
        Expanded(
            child: Image.asset(widget.imagepath ?? AppImagesPath.imageIcon)),
        // Image(
        //   image: Svg(widget.imagepath ?? AppImagesPath.imageIcon),
        //   height: 68,
        //   width: 68,
        // ),
        Align(
          alignment: Alignment.topRight,
          child: Icon(
            Icons.add_circle_rounded,
            color: AppColors.appBackgroundColor,
            size: 24,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "\$ ${widget.amount}",
            style: itemCardAmountStyle,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            textAlign: TextAlign.left,
            widget.textdata,
            style: itemCardSecondlineStyle,
          ),
        ),
      ],
    );
  }
}
