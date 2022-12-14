import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/const.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth,
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png"),
                  fit: BoxFit.cover)),
        ),
        kWidth
      ],
    );
  }
}
