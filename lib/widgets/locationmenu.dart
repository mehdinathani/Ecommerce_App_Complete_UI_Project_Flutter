import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/strings.dart';

import '../components/address.dart';
import '../styles/colors.dart';
import '../styles/typo.dart';

class LocationMenu extends StatefulWidget {
  static var selectedLocation = "Select Location";
  const LocationMenu({super.key});

  @override
  State<LocationMenu> createState() => _LocationMenuState();
}

class _LocationMenuState extends State<LocationMenu> {
  String? selectedLocation = LocationMenu.selectedLocation;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 170,
      label: Text(OnBoardingTextData.deliverd_to,
          style: appBarlastSubheadingStyle),
      textStyle: appBarlastHeadingStyle,
      initialSelection: selectedLocation,
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
          value: "Home",
          label: addresses['Home'].toString(),
        ),
        DropdownMenuEntry(
          value: "Office",
          label: addresses['Office'].toString(),
        ),
        DropdownMenuEntry(
          value: "Other",
          label: addresses['Other'].toString(),
        ),
      ],
      onSelected: (value) {
        setState(() {
          selectedLocation = value;
        });
      },
    );
  }
}
