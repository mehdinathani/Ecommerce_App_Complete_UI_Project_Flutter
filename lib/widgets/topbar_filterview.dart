import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/widgets/backbutton_custom.dart';
import 'package:uimehdinathani/widgets/cartIcon_badge.dart';

class TopBarFilterView extends StatefulWidget {
  const TopBarFilterView({super.key});

  @override
  State<TopBarFilterView> createState() => _TopBarFilterViewState();
}

class _TopBarFilterViewState extends State<TopBarFilterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      height: kIsWeb
          ? MediaQuery.of(context).size.height * 0.15
          : MediaQuery.of(context).size.height * 0.12,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomBackButton(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.15,
              ),
              Text(selectedTag),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.1,
              ),
              GestureDetector(
                child: const Icon(Icons.search),
                onTap: () {},
              ),
              const CartIconBadge(),
            ],
          )
        ],
      ),
    );
  }
}
