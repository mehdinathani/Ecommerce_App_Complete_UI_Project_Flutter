import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uimehdinathani/components/address.dart';
import 'package:uimehdinathani/screens/onBoarding/checkout_addcard.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/widgets/customToast.dart';

class SelectAddressCheckOut extends StatefulWidget {
  const SelectAddressCheckOut({super.key});

  @override
  State<SelectAddressCheckOut> createState() => _SelectAddressCheckOutState();
}

class _SelectAddressCheckOutState extends State<SelectAddressCheckOut> {
  TextEditingController addressName = TextEditingController();
  TextEditingController address = TextEditingController();
  FocusNode addressName1 = FocusNode();
  FocusNode address2 = FocusNode();

  late String address_name = '';
  late String address_detail = '';
  Map addAddress = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          //AppBar
          margin: const EdgeInsets.fromLTRB(30, 20, 10, 20),
          child: const Text(
            'Delivery Address',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Address.addressList.isNotEmpty
            ? Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                  itemCount: Address.addressList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(width: 1, color: AppColors.amountColor),
                        color: AppColors.black10,
                      ),
                      width: 330,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Text(
                                  Address.addressList[index]['addressName'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.amountColor,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Text(
                                  Address.addressList[index]['addressDetails'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      if (Address.addressList[index]
                                              ['addressSelected'] ==
                                          true) {
                                        Address.addressList[index]
                                            ['addressSelected'] = false;
                                      } else {
                                        Address.addressList[index]
                                            ['addressSelected'] = true;
                                      }
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Address.addressList[index]
                                              ['addressSelected'] ==
                                          true
                                      ? Colors.yellow
                                      : Colors.grey,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Address.addressList.removeAt(index);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Remove',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black60,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            : Container(
                height: 500,
                child: const Center(
                  child: Text(
                    'Add Address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: InkWell(
            onTap: () async {
              setState(() {});
              await showModalBottomSheet(
                backgroundColor: AppColors.appBackgroundColor,
                useSafeArea: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: 240,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: TextField(
                                  focusNode: addressName1,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 23, horizontal: 10),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        addressName.clear();
                                      },
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'Address Name',
                                    filled: true,
                                    fillColor: AppColors.whiteText,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 0.5),
                                    ),
                                  ),
                                  controller: addressName,
                                  onSubmitted: (String value) {
                                    address_name = addressName.text;
                                    FocusScope.of(context)
                                        .requestFocus(address2);
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: TextField(
                                  focusNode: address2,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 23, horizontal: 10),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        address.clear();
                                      },
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'Address',
                                    filled: true,
                                    fillColor: AppColors.whiteText,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                  ),
                                  controller: address,
                                  onSubmitted: (String value) {
                                    address_detail = address.text;
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(100, 50),
                                      backgroundColor: AppColors.whiteText,
                                      side: const BorderSide(
                                          width: 2, color: Colors.black),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    setState(() {
                                      if (addressName.text == '' &&
                                          address.text == '') {
                                        CustomToast.showToast(
                                            'Please fill both TextField');
                                      } else if (addressName.text == '') {
                                        CustomToast.showToast(
                                            'Please enter address name');
                                      } else if (address.text == '') {
                                        CustomToast.showToast(
                                            'Please enter address details');
                                      } else {
                                        address_name = addressName.text;
                                        address_detail = address.text;
                                        addressName.clear();
                                        address.clear();

                                        addAddress['addressName'] =
                                            address_name;
                                        addAddress['addressDetails'] =
                                            address_detail;
                                        addAddress['addressSelected'] = true;
                                        Address.addressList.add(
                                            Map<String, dynamic>.from(
                                                addAddress));
                                        addAddress = {};
                                        Navigator.pop(context);
                                      }
                                    });
                                  },
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
              setState(() {});
            },
            child: Center(
              child: Container(
                height: 50,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box_outlined,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Add New Address',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Address.addressList.isNotEmpty
            ? Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 122),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appBackgroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        fixedSize: const Size(327, 56)),
                    onPressed: () {
                      int Count = 0;
                      for (int i = 0; i < Address.addressList.length; i++) {
                        if (Address.addressList[i]['addressSelected'] == true) {
                          Count++;
                        }
                      }

                      if (Count == 0) {
                        CustomToast.showToast('Select an Address');
                      } else if (Count == 1) {
                        print(Address.addressList);
                        Navigator.push(
                          context,
                          PageTransition(
                            curve: Curves.linear,
                            type: PageTransitionType.rightToLeft,
                            child: const CheckOutAddCard(),
                          ),
                        );
                      } else {
                        CustomToast.showToast('Select only 1 Address');
                      }
                    },
                    child: const Text(
                      "Add Card",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
