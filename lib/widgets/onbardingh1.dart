import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class OnBoardingH1 extends StatelessWidget {
  final String headingtext;
  final TextStyle? styleh1;
  final String subtitleText;
  final TextStyle? styleS1;

  const OnBoardingH1({
    super.key,
    required this.headingtext,
    this.styleh1,
    required this.subtitleText,
    this.styleS1,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final spaceWidth = mediaQuery.size.width * 0.1; // Adjust as needed
    final spaceHeight = mediaQuery.size.width * 0.1;

    return Container(
      padding: const EdgeInsets.all(60),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: headingtext,
              style: styleh1,
            ),
            WidgetSpan(
              child: Container(
                width: spaceWidth,
              ),
            ),
            WidgetSpan(
              child: Image(
                width: mediaQuery.size.width * 0.1, // Adjust as needed
                height: mediaQuery.size.height * 0.04, // Adjust as needed
                image: const Svg("assets/images/home.svg"),
              ),
              baseline: TextBaseline.alphabetic,
              alignment: PlaceholderAlignment.baseline,
            ),
            WidgetSpan(
              child: Container(
                height: spaceHeight,
              ),
            ),
            TextSpan(
              text: subtitleText,
              style: styleS1,
            )
          ],
        ),
      ),
    );
  }
}
