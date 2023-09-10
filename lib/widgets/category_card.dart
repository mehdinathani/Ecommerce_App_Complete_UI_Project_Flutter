import 'package:flutter/material.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/widgets/generalCard.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName;
  final String tag;
  final String imagePath;
  const CategoryCard(
      {super.key,
      required this.categoryName,
      required this.tag,
      required this.imagePath});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      cardColor: AppColors.black1,
      cardRadius: 12,
      height: 164,
      width: 154,
      children: [
        Expanded(child: Image.asset(widget.imagePath)),
        // Image(
        //   height: 56.67,
        //   width: 56.67,

        //   image: Svg(
        //     widget.imagePath,
        //     color: AppColors.black,
        //   ),
        // ),
        Text(widget.categoryName),
        Text(widget.tag),
      ],
    );
  }
}
