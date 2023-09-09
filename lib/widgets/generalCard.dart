import 'package:flutter/material.dart';
import 'package:uimehdinathani/styles/colors.dart';

class GeneralCard extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? cardColor;
  final double? cardRadius;
  final List<Widget>? children;

  const GeneralCard({
    super.key,
    this.width,
    this.height,
    this.cardColor,
    this.cardRadius,
    this.children,
  });

  @override
  State<GeneralCard> createState() => _GeneralCardState();
}

class _GeneralCardState extends State<GeneralCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: widget.width ?? 269,
      height: widget.height ?? 1123,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.cardRadius ?? 16),
        ),
        color: widget.cardColor ?? AppColors.orange1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: widget.children ?? [],
      ),
    );
  }
}
