import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/locationmenu.dart';

import 'deliveryTimeMenu.dart';

class TopBarBackground extends StatefulWidget {
  final bool? isgreet;
  final String? username;
  const TopBarBackground({super.key, this.username, this.isgreet});

  @override
  State<TopBarBackground> createState() => _TopBarBackgroundState();
}

class _TopBarBackgroundState extends State<TopBarBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.sizeOf(context).width * 1,
      height: MediaQuery.sizeOf(context).height * 0.30,
      // child: Align(
      //   alignment: Alignment.topCenter,
      //   child: FractionallySizedBox(
      //     widthFactor: 1,
      //     heightFactor: 0.30,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        color: AppColors.blue1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultTextStyle(
                  style: usernamestyle,
                  child: Text(
                    greetuser(widget.isgreet!, widget.username),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                showCartIcon(true),
              ],
            ),
            _searchField(),
            appBarlastSubheading(
              OnBoardingTextData.deliverd_to,
              OnBoardingTextData.within,
            ),
          ],
        ),
      ),
    );
  }
}

// extra funtions
String greetuser(bool isgreet, String? username) {
  return isgreet ? "Hey, ${username ?? 'User'}" : " ";
}

Container showCartIcon(bool isCartIconShow) {
  String imagePath = "assets/images/bag.svg";
  return isCartIconShow
      ? Container(
          child: Image(image: Svg(imagePath)),
        )
      : Container();
}

Container _searchField() {
  return Container(
    // margin: EdgeInsets.only(top: 40, left: 20, right: 20),
    decoration: BoxDecoration(
      color: AppColors.searchFieldColor,
      borderRadius: BorderRadius.circular(25),
    ),
    child: TextField(
      decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.all(15),
          hintText: OnBoardingTextData.searchFieldHintText,
          hintStyle: searchFieldHintTextStyle,
          prefixIcon: Padding(
            padding: EdgeInsets.all(12),
            child: Image(
              image: Svg(AppImagesPath.searchIcon),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none)),
    ),
  );
}

appBarlastSubheading(String firsttext, String secondtext) {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      LocationMenu(),
      Spacer(),
      DeliveryTimeMenu(),
    ],
  );
}

Container showSearchIcon(bool isSearchIconShow) {
  String imagePath = "assets/images/Search.svg";
  return isSearchIconShow
      ? Container(
          child: Image(image: Svg(imagePath)),
        )
      : Container();
}
