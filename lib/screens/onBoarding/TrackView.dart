import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/address.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
import 'package:uimehdinathani/screens/onBoarding/groceryhome.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/widgets/backbutton_custom_home_page.dart';
import 'package:uimehdinathani/widgets/customToast.dart';

class TrackView extends StatefulWidget {
  final int orderNumber;
  final String riderName;
  const TrackView(
      {super.key, required this.orderNumber, required this.riderName});

  @override
  State<TrackView> createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  //AppBar
                  margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                  child: const Row(
                    children: [CustomBackButtonHome(), Text("Track Order")],
                  )),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(AppImagesPath.map),
                  ),
                  Container(
                    height: 80,
                    width: 335,
                    decoration: BoxDecoration(
                      color: AppColors.black10,
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.appBackgroundColor,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 20.0,
                                spreadRadius: .5,
                              ), //BoxShadow
                              BoxShadow(
                                color: AppColors.appBackgroundColor,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 0.6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: AppColors.black10,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage(AppImagesPath.Rider),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery Man',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.amountColor),
                            ),
                            Text(
                              widget.riderName,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.amountColor),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: FloatingActionButton(
                            backgroundColor: AppColors.appBackgroundColor,
                            onPressed: () {
                              CustomToast.showToast('Rider lost contact :)');
                            },
                            child: const Icon(Icons.message_rounded),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10),
                child: ListTile(
                  leading: Icon(Icons.alarm_outlined),
                  title: Text(
                    'Delivery In',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.amountColor),
                  ),
                  subtitle: Text(
                    '25 Min',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.amountColor),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 10, bottom: 15),
                child: ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: Text(
                    'Delivery Address',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.amountColor),
                  ),
                  subtitle: Text(
                    Address.addressList[0]['addressDetails'],
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.amountColor),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                    height: 6,
                    width: 75,
                    decoration: BoxDecoration(
                      color: AppColors.appBackgroundColor,
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10, bottom: 0),
                child: ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Order Details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.amountColor,
                          ),
                        ),
                        TextSpan(
                          text: '    (ID: #${widget.orderNumber})',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.amountColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(200, 50)),
                  onPressed: () {
                    setState(() {
                      // empty cart items
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const GroceryHome())));
                  },
                  child: Text(
                    'Go To MainMenu',
                    style: TextStyle(
                        color: AppColors.whiteText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
