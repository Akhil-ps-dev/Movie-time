import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/Home/widget/number_card.dart';

import '../../core/const.dart';
import '../widgets/main_home_card.dart';
import '../widgets/main_title.dart';
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
        const MainTitleCard(
          title: 'Trending Now',
        ),

        ///! Number Card Widget
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainTitle(
              title: 'top 10 Tv Shows In India Today',
            ),
            kHeight,
            //!Error hasSize----{ note add expanded or LimitedBox}
            LimitedBox(
              maxHeight: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (ctx, index) => const SizedBox(),
                itemBuilder: (ctx, index) {
                  return NumberCardWidget(
                    index: index,
                  );
                },
              ),
            )
          ],
        ),

        const MainTitleCard(
          title: 'Tense Dramas',
        ),
        const MainTitleCard(
          title: 'South Indians Cinema',
        ),
        // MainTitleCard(),
      ],
    ));
  }
}
