import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';

import '../../../core/const.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 150,
            ),
            Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: kBorderR10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/djM2s4wSaATn4jVB33cV05PEbV7.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 20,
          bottom: 0,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kWhite,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  fontSize: 130,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
