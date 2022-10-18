import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomIconWidger extends StatelessWidget {
  const CustomIconWidger(
      {Key? key,
      required this.icon,
      required this.text,
      this.color = kWhite,
      this.iconSize = 28,
      this.fontSize = 18})
      : super(key: key);
  final IconData icon;
  final String text;
  final double iconSize;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: iconSize,
        ),
        Text(
          text,
          style: TextStyle(fontSize: fontSize, color: color),
        ),
      ],
    );
  }
}
