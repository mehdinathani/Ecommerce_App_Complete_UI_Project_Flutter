import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/backbutton_custom.dart';
import 'package:uimehdinathani/widgets/topBarBackground.dart';

class GeneralTopBar extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? color;
  final List<Widget>? children;
  final bool? isgreet;
  final String? username;
  final bool? isSearchIconShow;
  final Color? searchIconColor;
  final bool? isCartIconShow;
  final Color? cartIconColor;
  final bool? showCustomBackButton;

  const GeneralTopBar(
      {super.key,
      this.isgreet,
      this.username,
      this.width,
      this.height,
      this.color,
      this.children,
      this.isSearchIconShow,
      this.searchIconColor,
      this.isCartIconShow,
      this.cartIconColor,
      this.showCustomBackButton});

  @override
  State<GeneralTopBar> createState() => _GeneralTopBarState();
}

class _GeneralTopBarState extends State<GeneralTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: widget.width ?? MediaQuery.sizeOf(context).width * 1,
      height: kIsWeb
          ? MediaQuery.sizeOf(context).height * 0.4
          : widget.height ?? MediaQuery.sizeOf(context).height * 0.30,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        color: widget.color ?? AppColors.blue1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.showCustomBackButton ?? false
                    ? const CustomBackButton()
                    : SizedBox(),
                DefaultTextStyle(
                  style: usernamestyle,
                  child: Text(
                    greetuser(widget.isgreet ?? false, widget.username),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                showSearchIcon(
                    widget.isSearchIconShow ?? true, widget.searchIconColor),
                const SizedBox(
                  width: 3,
                ),
                showCartIcon(
                    widget.isCartIconShow ?? true, widget.cartIconColor),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: widget.children ?? [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
