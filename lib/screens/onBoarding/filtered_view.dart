import 'package:flutter/material.dart';
import 'package:uimehdinathani/widgets/choicechip_tags.dart';

class filtered_view extends StatefulWidget {
  const filtered_view({super.key});

  @override
  State<filtered_view> createState() => _filtered_viewState();
}

class _filtered_viewState extends State<filtered_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilterTags(),
    );
  }
}
