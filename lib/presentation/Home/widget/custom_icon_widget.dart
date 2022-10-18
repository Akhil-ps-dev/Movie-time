import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomIconWidger extends StatelessWidget {
  const CustomIconWidger(
      {Key? key,
      required this.icon,
      required this.text,
      this.textSize = 28,
      this.fontSize = 18})
      : super(key: key);
  final IconData icon;
  final String text;
  final double textSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: textSize,
        ),
        Text(
          text,
          style: TextStyle(fontSize: fontSize, color: kWhite),
        ),
      ],
    );
  }
}
