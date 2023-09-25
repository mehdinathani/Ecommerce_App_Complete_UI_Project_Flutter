import 'package:flutter/material.dart';
import 'package:uimehdinathani/screens/onBoarding/categoryview.dart';
import 'package:uimehdinathani/screens/onBoarding/favItems_view.dart';
import 'package:uimehdinathani/screens/onBoarding/filtered_view.dart';
import 'package:uimehdinathani/screens/onBoarding/groceryhome.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _currentIndex = 0; // To keep track of the selected tab index

  final List<Widget> _screens = [
    GroceryHome(),
    CategoryView(),
    filtered_view(),
    FavItemsView(),
  ];

  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          children: _screens,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tag_rounded),
              label: "Tags",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_sharp,
                color: Colors.red,
              ),
              label: "Favirite",
            )
          ],
        ),
      ),
    );
  }
}
