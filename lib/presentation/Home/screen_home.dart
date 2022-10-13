import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/const.dart';
import 'package:flutter_movie_app/presentation/widgets/main_title.dart';

import '../widgets/main_home_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainTitle(
            title: 'Released in the past year',
          ),
          //!Error hasSize----{ note add expanded or LimitedBox}
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (ctx, index) => kWidth,
              itemBuilder: (ctx, index) {
                return MainHomeCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
