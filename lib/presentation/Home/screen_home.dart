import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movie_app/presentation/Home/widget/number_tile_card.dart';

import '../../core/const.dart';
import 'widget/main_title_card.dart';

ValueNotifier<bool> scrollDirectionVisible = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollDirectionVisible,
        builder: (BuildContext ctx, bool newIndex, Widget? _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              final ScrollDirection direction = notification.direction;

              if (direction == ScrollDirection.forward) {
                return scrollDirectionVisible.value = true;
              } else if (direction == ScrollDirection.reverse) {
                return scrollDirectionVisible.value = false;
              }
              return true;
            }),
            child: Stack(
              children: [
                ListView(
                  children: const [
                    MainTitleCard(
                      title: 'Released in Past year',
                    ),
                    kHeight,
                    MainTitleCard(
                      title: 'Trending Now',
                    ),
                    kHeight,

                    ///! Number Card Widget
                    NumberTileCard(),
                    kHeight,

                    MainTitleCard(
                      title: 'Tense Dramas',
                    ),
                    kHeight,
                    MainTitleCard(
                      title: 'South Indians Cinema',
                    ),
                  ],
                ),
                scrollDirectionVisible.value == true
                    ? Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.red,
                      )
                    : kHeight
              ],
            ),
          );
        },
      ),
    );
  }
}
