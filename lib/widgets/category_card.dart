import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
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
        Image(
          height: 56.67,
          width: 56.67,
          image: Svg(
            widget.imagePath,
            color: AppColors.black,
          ),
        ),
        Text(widget.categoryName),
        Text(widget.tag),
      ],
    );
  }
}
