import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/presentation/Home/widget/number_tile_card.dart';

import '../../core/const.dart';
import 'widget/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: const BoxDecoration(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Icon(
                          Icons.add,
                          color: kWhite,
                          size: 28,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(fontSize: 20, color: kWhite),
                        ),
                      ],
                    ),
                    _playButton(),
                  ],
                ),
              )
            ],
          ),
          const MainTitleCard(
            title: 'Released in Past year',
          ),
          kHeight,
          const MainTitleCard(
            title: 'Trending Now',
          ),
          kHeight,

          ///! Number Card Widget
          const NumberTileCard(),
          kHeight,

          const MainTitleCard(
            title: 'Tense Dramas',
          ),
          kHeight,
          const MainTitleCard(
            title: 'South Indians Cinema',
          ),
        ],
      ),
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
