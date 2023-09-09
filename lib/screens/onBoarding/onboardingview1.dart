// import 'package:flutter/material.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';
// import 'package:uimehdinathani/components/strings.dart';
// import 'package:uimehdinathani/styles/colors.dart';
// import 'package:uimehdinathani/styles/typo.dart';
// import 'package:uimehdinathani/widgets/CustomButton.dart';

// import '../../widgets/onbardingh1.dart';

// class OnBoardingView extends StatefulWidget {
//   const OnBoardingView({super.key});

//   @override
//   State<OnBoardingView> createState() => _OnBoardingViewState();
// }

// class _OnBoardingViewState extends State<OnBoardingView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(),
//       body: SafeArea(
//         child: Container(
//             width: double.infinity,
//             color: AppColors.appBackgroundColor,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       OnBoardingH1(
//                         styleh1: h1style,
//                         styleS1: h4style,
//                         headingtext: OnBoardingTextData.h1text1,
//                         subtitleText: OnBoardingTextData.content1text1,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(
//                           left: 65,
//                         ),
//                         child: Row(
//                           children: [
//                             Image(
//                               image: Svg("assets/images/Line 1.svg"),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Image(
//                               image: Svg("assets/images/Line 3.svg"),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 80,
//                       ),
//                       const Image(
//                         image: Svg("assets/images/Image Icon.svg"),
//                       ),
//                     ],
//                   ),
//                 ),
//                 CustomButton(
//                   buttonIcon: Icons.arrow_forward_outlined,
//                   textColor: AppColors.getstartedTextColor,
//                   buttonColor: AppColors.getstartedbuttonColor,
//                   buttonText: OnBoardingTextData.getstarted,
//                   onPressed: () {},
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
