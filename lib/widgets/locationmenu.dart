import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/strings.dart';
import '../components/address.dart'; // Import the Address class
import '../styles/colors.dart';
import '../styles/typo.dart';

class LocationMenu extends StatefulWidget {
  static var selectedLocation = Address.addressList[0]['addressName'];
  const LocationMenu({Key? key}) : super(key: key);

  @override
  State<LocationMenu> createState() => _LocationMenuState();
}

class _LocationMenuState extends State<LocationMenu> {
  String? selectedLocation = LocationMenu.selectedLocation;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 170,
      label: Text(
        OnBoardingTextData.deliverd_to,
        style: appBarlastSubheadingStyle,
      ),
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
      dropdownMenuEntries: List.generate(
        Address.addressList.length,
        (index) {
          return DropdownMenuEntry(
            value: Address.addressList[index]['addressName'],
            label: Address.addressList[index]['addressDetails'],
          );
        },
      ),
      onSelected: (value) {
        setState(() {
          selectedLocation = value;
        });
      },
    );
  }
}
