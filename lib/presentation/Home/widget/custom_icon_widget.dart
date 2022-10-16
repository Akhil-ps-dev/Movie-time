import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomIconWidger extends StatelessWidget {
  const CustomIconWidger({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: 28,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: kWhite),
        ),
      ],
    );
  }
}
