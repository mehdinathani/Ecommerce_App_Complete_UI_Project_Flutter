import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/deliveryTime.dart';

import '../components/strings.dart';
import '../styles/colors.dart';
import '../styles/typo.dart';

class DeliveryTimeMenu extends StatefulWidget {
  static String? selectedTime = DeliveryTime.oneHour;
  const DeliveryTimeMenu({super.key});

  @override
  State<DeliveryTimeMenu> createState() => _DeliveryTimeMenuState();
}

class _DeliveryTimeMenuState extends State<DeliveryTimeMenu> {
  String? selectedTime = DeliveryTimeMenu.selectedTime;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 90.94,
      label: Text(
        textAlign: TextAlign.justify,
        OnBoardingTextData.within,
        style: appBarlastSubheadingStyle,
        overflow: TextOverflow.visible,
      ),
      textStyle: appBarlastHeadingStyle,
      initialSelection: selectedTime,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: appBarlastHeadingStyle,
        labelStyle: appBarlastSubheadingStyle,
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      trailingIcon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.h4color,
      ),
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: "1",
          label: DeliveryTime.oneHour,
        ),
        DropdownMenuEntry(
          value: "2",
          label: DeliveryTime.twoHours,
        ),
        DropdownMenuEntry(
          value: "3",
          label: DeliveryTime.threehour,
        ),
      ],
      onSelected: (value) {
        setState(() {
          selectedTime = value;
          print(selectedTime);
        });
      },
    );
  }
}
