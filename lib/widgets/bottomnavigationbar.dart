import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:uimehdinathani/screens/onBoarding/onboardingviewv02.dart';
import 'package:uimehdinathani/styles/colors.dart';

import '../screens/onBoarding/groceryhome.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = const [
    GroceryHome(),
    OnBoardingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("aaa"),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
                notchBottomBarController: _controller,
                color: AppColors.whiteText,
                showLabel: true,
                notchColor: AppColors.black,
                removeMargins: true,
                bottomBarWidth: 500,
                durationInMilliSeconds: 300,
                bottomBarItems: const [
                  BottomBarItem(
                      inActiveItem: Icon(Icons.home),
                      activeItem: Icon(Icons.home_filled),
                      itemLabel: "Home"),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.star,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 189, 204, 231),
                    ),
                    itemLabel: 'Page 2',
                  ),
                ],
                onTap: (index) {
                  /// perform action on tab change and to update pages you can update pages without pages
                  print('current selected index $index');
                  _pageController.jumpToPage(index);
                })
            : null);
  }
}
