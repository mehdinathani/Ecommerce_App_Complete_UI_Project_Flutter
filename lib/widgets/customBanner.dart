import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'customtile.dart';

class CustomBannerSlidding extends StatefulWidget {
  const CustomBannerSlidding({super.key});

  @override
  State<CustomBannerSlidding> createState() => _CustomBannerSliddingState();
}

class _CustomBannerSliddingState extends State<CustomBannerSlidding> {
  List<CustomTile> banners = CustomTile.getBanners();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: CarouselSlider(
        items: banners.map((banner) {
          return CustomTile(
            bannertileColor: banner.bannertileColor,
            bannerFirststring: banner.bannerFirststring,
            bannerSecondString: banner.bannerSecondString,
            bannerThirdString: banner.bannerThirdString,
          );
        }).toList(),
        options: CarouselOptions(
          height: 123,
          autoPlay: true,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
