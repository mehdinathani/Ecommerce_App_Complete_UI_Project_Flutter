import 'package:flutter/material.dart';
import 'package:uimehdinathani/widgets/favItems_builder.dart';
import 'package:uimehdinathani/widgets/topBarBackground.dart';

class FavItemsView extends StatefulWidget {
  const FavItemsView({super.key});

  @override
  State<FavItemsView> createState() => _FavItemsViewState();
}

class _FavItemsViewState extends State<FavItemsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      body: const Column(
        children: [
          TopBarBackground(
            isgreet: false,
            showCustomBackButton: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FavItemsBuilder(),
            ),
          )
        ],
      ),
    ));
  }
}
