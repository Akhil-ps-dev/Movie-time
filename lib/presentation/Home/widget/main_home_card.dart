import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/const.dart';

class MainHomeCard extends StatelessWidget {
  final String imageUrl;

  const MainHomeCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: kBorderR10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
