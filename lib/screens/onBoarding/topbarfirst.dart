import 'package:flutter/material.dart';

import '../../widgets/topBarBackground.dart';

class TopBarFirst extends StatefulWidget {
  const TopBarFirst({super.key});

  @override
  State<TopBarFirst> createState() => _TopBarFirstState();
}

class _TopBarFirstState extends State<TopBarFirst> {
  @override
  Widget build(BuildContext context) {
    return TopBarBackground(
      isgreet: true,
      username: "Me",
    );
  }
}
