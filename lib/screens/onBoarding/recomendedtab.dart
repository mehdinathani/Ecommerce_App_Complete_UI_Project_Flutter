import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/recomendedItems.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/recomendItemCard.dart';

class RecomendedTab extends StatefulWidget {
  const RecomendedTab({super.key});

//  List<RecomendedItems> recomendedItem = [];
  static RecomendedItems recomendedItems = RecomendedItems();

  @override
  State<RecomendedTab> createState() => _RecomendedTabState();
}

class _RecomendedTabState extends State<RecomendedTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              OnBoardingTextData.Recommended,
              style: recommendedStyle,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.011,
        ),
        Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 194,
            width: double.infinity,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recomendedItem =
                      RecomendedItems().recomendedItem[index];
                  return RecomendedItemCard(
                    firstlineText: recomendedItem['name'],
                    secondLineText: recomendedItem['tagline'],
                    amount: recomendedItem['price'],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount: RecomendedItems().recomendedItem.length))
      ],
    );
  }
}
