import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';

import '../../../core/const.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget(
      {super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: kBorderR10,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 20,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kWhite,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  fontSize: 140,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
