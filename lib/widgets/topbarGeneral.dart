import 'package:flutter/material.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/topBarBackground.dart';

class GeneralTopBar extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? color;
  final List<Widget>? children;
  final bool? isgreet;
  final String? username;
  const GeneralTopBar(
      {super.key,
      this.isgreet,
      this.username,
      this.width,
      this.height,
      this.color,
      this.children});

  @override
  State<GeneralTopBar> createState() => _GeneralTopBarState();
}

class _GeneralTopBarState extends State<GeneralTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: widget.width ?? MediaQuery.sizeOf(context).width * 1,
      height: widget.height ?? MediaQuery.sizeOf(context).height * 0.30,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        color: widget.color ?? AppColors.blue1,
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
                showSearchIcon(true),
                const SizedBox(
                  width: 3,
                ),
                showCartIcon(true),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: widget.children ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
