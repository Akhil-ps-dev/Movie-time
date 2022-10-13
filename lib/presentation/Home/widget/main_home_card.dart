import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/const.dart';

class MainHomeCard extends StatelessWidget {
  const MainHomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: kBorderR10,
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg'))),
    );
  }
}
