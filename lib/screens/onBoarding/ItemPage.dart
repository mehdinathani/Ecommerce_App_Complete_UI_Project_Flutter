import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:uimehdinathani/components/Items.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/backbutton_custom.dart';
import 'package:uimehdinathani/widgets/cartIcon_badge.dart';

class ItemView extends StatefulWidget {
  final int itemIndex;
  static Items items = Items();
  const ItemView({super.key, required this.itemIndex});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    bool isFavourite = true;
    // Map selectedItem = ItemView.items.itemList[1];

    Map selectedItem = ItemView.items.itemList[widget.itemIndex];
    // List<String> images = ItemView.items.itemList[widget.itemIndex]['img'];
    List<String> images = selectedItem['img'];
    String itemName = selectedItem['name'];

    final pages = List.generate(
        images.length,
        (index) => Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(images[index]),
                ),
              ),
            ));
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomBackButton(),
                  Spacer(),
                  Text(
                    itemName,
                    style: productNameHeadingStyle,
                  ),
                  Spacer(),
                  CartIconBadge(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: PageView.builder(
                    controller: controller,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                      dotHeight: 4,
                      dotWidth: 10,
                      dotColor: AppColors.black45,
                      activeDotColor: AppColors.orange1),
                ),
              ),
              // Product Details sheet
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: AppColors.black1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 16),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  selectedItem['name'],
                                  style: productDetailTitleStyle,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (isFavourite == false) {
                                    //add to favourite pending

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("Item added to favourites !"),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                    print(isFavourite);
                                    isFavourite = !(isFavourite);
                                    print(isFavourite);
                                  } else {
                                    //remove from favourite pending
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "Item removed from favourite !"),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                    print(isFavourite);
                                    isFavourite = !(isFavourite);
                                    print(isFavourite);
                                  }
                                  setState(() {});
                                },
                                icon: Icon(
                                  isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color:
                                      isFavourite ? Colors.red : Colors.black,
                                  size: 26,
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Wrap(
                                    children: [
                                      Text(
                                        "\$ ${(selectedItem['price'] * 0.9).toString()}",
                                        style: productPriceStyle,
                                      ),
                                      Text(
                                        "/KG",
                                        style: productKGStyle,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.appBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 2),
                                        child: Text(
                                          "\$ ${(selectedItem['price'] * 0.10).toString()} OFF",
                                          style: productDiscountPriceStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                      ),
                                      Text("Reg: \$ ${selectedItem['price']}")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            child: Row(
                              children: [
                                SmoothStarRating(
                                    color: Colors.yellow,
                                    rating: selectedItem['starRating'],
                                    size: 25,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border,
                                    starCount: 5,
                                    allowHalfRating: true,
                                    spacing: 2.0,
                                    onRatingChanged: (value) {
                                      setState(() {
                                        // rating = value;
                                      });
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${selectedItem['review'].length} Reviews",
                                  style: reviewsCountStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            child: Theme(
                                data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  initiallyExpanded: true,
                                  collapsedIconColor: AppColors.h4color,
                                  expandedAlignment: Alignment.centerLeft,
                                  tilePadding: EdgeInsets.zero,
                                  title:
                                      const Text("Details", style: TextStyle()),
                                  children: [
                                    Text(
                                      "${selectedItem['description']}",
                                      style: productPriceStyle,
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            child: Theme(
                                data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  initiallyExpanded: false,
                                  collapsedIconColor: AppColors.h4color,
                                  expandedAlignment: Alignment.centerLeft,
                                  tilePadding: EdgeInsets.zero,
                                  title: const Text("Nutritional facts",
                                      style: TextStyle()),
                                  children: [
                                    Text(
                                      "${selectedItem['nurtrionalFact']}",
                                      style: productPriceStyle,
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            child: Theme(
                                data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  initiallyExpanded: false,
                                  collapsedIconColor: AppColors.h4color,
                                  expandedAlignment: Alignment.centerLeft,
                                  tilePadding: EdgeInsets.zero,
                                  title:
                                      const Text("Reviews", style: TextStyle()),
                                  children: [
                                    SingleChildScrollView(
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            selectedItem['review'].length,
                                        itemBuilder: ((context, index) =>
                                            ListTile(
                                              title: Text(
                                                selectedItem['review'][index]
                                                        ['review']
                                                    .toString(),
                                              ),
                                              subtitle: Text(
                                                  selectedItem['review'][index]
                                                          ['starRating']
                                                      .toString()),
                                            )),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
