import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/CustomButton.dart';
import 'package:uimehdinathani/widgets/custom_bottom_bar.dart';

import '../../widgets/onbardingh1.dart';

final List<String> imgList = [
  'assets/images/shopping.gif',
];

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController controller = PageController();

  final List<Widget> _list = [
    Center(
      child: Pages(
        headingtext: OnBoardingTextData.h1text1,
        subtitleText: OnBoardingTextData.content1text1,
        firstLineImagePath: "assets/images/Line 1.svg",
        secondLineImagePath: "assets/images/Line 3.svg",
      ),
    ),
    Center(
      child: Pages(
        headingtext: OnBoardingTextData.h1text2,
        subtitleText: OnBoardingTextData.content1text2,
        firstLineImagePath: "assets/images/Line 3.svg",
        secondLineImagePath: "assets/images/Line 1.svg",
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
      child: PageView(
        allowImplicitScrolling: true,
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (num) {
          setState(() {
            // print(_curr);
          });
        },
        children: _list,
      ),
    ));
  }
}

class Pages extends StatelessWidget {
  final String headingtext;
  final String subtitleText;
  final String firstLineImagePath;
  final String secondLineImagePath;

  const Pages({
    super.key,
    required this.headingtext,
    required this.subtitleText,
    required this.firstLineImagePath,
    required this.secondLineImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.appBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [
                OnBoardingH1(
                  styleh1: h1style,
                  styleS1: h4style,
                  headingtext: headingtext,
                  subtitleText: subtitleText,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: Svg(firstLineImagePath),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: Svg(secondLineImagePath),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                    ),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                  child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                height: 100000,
                                width: 100000,
                              )),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            buttonIcon: Icons.arrow_forward_outlined,
            textColor: AppColors.getstartedTextColor,
            buttonColor: AppColors.getstartedbuttonColor,
            buttonText: OnBoardingTextData.getstarted,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomBottomBar(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
