import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/components/tags_filtered_data.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/dealsItemCard.dart';
import 'package:uimehdinathani/widgets/recomendItemCard.dart';
import 'package:uimehdinathani/widgets/topbar_filterview.dart';

class FilterTags extends StatefulWidget {
  const FilterTags({super.key});

  @override
  State<FilterTags> createState() => _FilterTagsState();
}

class _FilterTagsState extends State<FilterTags> {
  List<String> uniqueTags = getUniqueTags();

  @override
  Widget build(BuildContext context) {
    List itemsInTag = getItemsByTags(selectedTag);
    return Column(
      children: [
        TopBarFilterView(),
        Wrap(
          // Use Wrap for better chip layout
          spacing: 8, // Adjust the spacing as needed
          children: uniqueTags.map(
            (uniqueTag) {
              return ChoiceChip(
                labelStyle: choiceChiptagsStyle,
                selectedColor: AppColors.orange1,
                disabledColor: AppColors.h4color,
                label: Text(uniqueTag),
                selected: (selectedTag == uniqueTag),
                onSelected: (isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedTag = uniqueTag;
                    } else {
                      selectedTag = ''; // Clear the selection
                    }
                  });
                },
              );
            },
          ).toList(),
        ),
        // Here, you can display itemsInCategory based on selectedTag
        // For example, you can create a ListView of items here.
        Expanded(
          child: GridView.builder(
              itemCount: itemsInTag.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                List itemsInTag = getItemsByTags(selectedTag);
                final item = itemsInTag[index];
                return DealsIteamCard(
                  amount: item['price'],
                  textdata: item['name'],
                  imagepath: item['img'][0],
                );
                // RecomendedItemCard(
                //   firstlineText: item['name'],
                //   secondLineText: item['name'],
                //   amount: item['price'],
                //   imagePath: item['img'][0],
                // );
              }),
          // ListView.builder(
          //     itemCount: itemsInTag.length,
          //     itemBuilder: (context, index) {
          //       List itemsInTag = getItemsByTags(selectedTag);
          //       final item = itemsInTag[index];
          //       return RecomendedItemCard(
          //         firstlineText: item['name'],
          //         secondLineText: item['name'],
          //         amount: item['price'],
          //         imagePath: item['img'][0],
          //       );
          //     }),
        )
      ],
    );
  }
}

getUniqueTagsNames() {
  // Items items = Items(); // Create an instance of the Items class
  List<String> uniqueTags = getUniqueTags();
  // Now, uniqueTags contains the unique category names.
  print(uniqueTags);
}
