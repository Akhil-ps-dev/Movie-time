import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/const.dart';
import 'custom_icon_widget.dart';
class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(kMainImg),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomIconWidger(
                  text: "My List",
                  icon: Icons.play_arrow,
                ),
                _playButton(),
                const CustomIconWidger(
                  text: "Info",
                  icon: Icons.info,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          kWhite,
        ),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: kBlack,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(fontSize: 23, color: kBlack),
        ),
      ),
    );
  }
}
