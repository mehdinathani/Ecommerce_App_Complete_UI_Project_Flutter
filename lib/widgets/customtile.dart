import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
import 'package:uimehdinathani/styles/typo.dart';

import '../styles/colors.dart';

class CustomTile extends StatefulWidget {
  final Color bannertileColor;
  final String? bannertileImagePath;
  final String bannerFirststring;
  final String bannerSecondString;
  final String bannerThirdString;

  const CustomTile({
    super.key,
    required this.bannertileColor,
    this.bannertileImagePath,
    required this.bannerFirststring,
    required this.bannerSecondString,
    required this.bannerThirdString,
  });

  static List<CustomTile> getBanners() {
    List<CustomTile> banners = [];

    banners.add(
      CustomTile(
        bannertileColor: AppColors.orange1,
        bannerFirststring: "Get",
        bannerSecondString: "50% OFF",
        bannerThirdString: "On first 03 orders",
        bannertileImagePath: AppImagesPath.shoppingBag,
      ),
    );

    banners.add(
      CustomTile(
        bannertileColor: AppColors.secondBannerColor,
        bannerFirststring: "Get",
        bannerSecondString: "Free Shipping",
        bannerThirdString: "On first order",
        bannertileImagePath: AppImagesPath.freeShipping,
      ),
    );
    return banners;
  }

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: 269,
      height: 123,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: widget.bannertileColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              // child: Image.asset(
              //     widget.bannertileImagePath ?? AppImagesPath.imageIcon),
              child: Image(
                height: 100,
                image: Svg(
                  widget.bannertileImagePath ?? AppImagesPath.imageIcon,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.bannerFirststring,
                    style: bannerFirststringStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.bannerSecondString,
                    style: bannerSecondStringStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.bannerThirdString,
                    style: bannerThirdStringStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
