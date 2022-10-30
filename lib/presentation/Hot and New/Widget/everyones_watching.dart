import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/const.dart';
import '../../Home/widget/custom_icon_widget.dart';
import '../video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight,
        const Text(
          "Lou",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        kHeight,
        const Text(
          "A young girl is kidnapped during a powerful storm.\n Her mother joins forces with her mysterious \nneighbour to set off in pursuit of the kidnapper.\n Their journey will test their limits and expose\n the dark secrets of their past.",
          style: TextStyle(color: kGrey),
        ),
        kHeight,
        VideoWidget(
          url: posterPath,
        ),
        kHeight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomIconWidger(
              icon: Icons.send,
              text: "Share",
              fontSize: 15,
              iconSize: 25,
              color: kGrey,
            ),
            kWidth,
            CustomIconWidger(
              icon: Icons.add,
              text: "My List",
              fontSize: 15,
              iconSize: 25,
              color: kGrey,
            ),
            kWidth,
            CustomIconWidger(
              icon: Icons.play_arrow,
              text: "Play",
              fontSize: 15,
              iconSize: 25,
              color: kGrey,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
