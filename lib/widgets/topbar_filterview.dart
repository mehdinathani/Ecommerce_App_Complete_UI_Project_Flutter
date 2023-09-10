import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/styles/colors.dart';

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
      height: MediaQuery.of(context).size.height * 0.08,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.black,
              ),
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
              InkWell(
                onTap: () {},
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}
