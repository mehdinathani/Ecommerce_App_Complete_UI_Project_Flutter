import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/Items.dart';
import 'package:uimehdinathani/styles/colors.dart';

class ItemView extends StatefulWidget {
  static Items items = Items();
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    List<String> images = ItemView.items.itemList[0]['img'];
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                CarouselSlider(
                  items: images.map<Widget>(
                    (item) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    height: 200,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
