import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/presentation/Home/widget/custom_icon_widget.dart';
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

  
}
