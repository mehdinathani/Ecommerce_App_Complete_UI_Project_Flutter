import 'package:flutter/material.dart';
import 'package:uimehdinathani/widgets/dealsItemCard.dart';

import '../../components/deals.dart';
import '../../components/recomendedItems.dart';
import '../../components/strings.dart';
import '../../styles/typo.dart';

class DealsView extends StatefulWidget {
  static RecomendedItems recomendedItems = RecomendedItems();
  static List fruitsDeal = getItemsDeal(category: 'Vegetable');

  // static List fruitsDeal = getItemsDeal(category: todaysDeals('Fruits'));

  const DealsView({super.key});

  @override
  State<DealsView> createState() => _DealsViewState();
}

class _DealsViewState extends State<DealsView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(left: 20),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            OnBoardingTextData.dealsin,
            style: recommendedStyle,
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.011,
      ),
      Container(
        padding: const EdgeInsets.all(20),
        height: 194,
        width: double.infinity,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final fruitsDeal = DealsView.fruitsDeal[index];
              return DealsIteamCard(
                textdata: fruitsDeal['name'],
                amount: fruitsDeal['price'],
                imagepath: fruitsDeal['img'][0],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
            itemCount: DealsView.fruitsDeal.length),
      )
    ]);
  }
}
