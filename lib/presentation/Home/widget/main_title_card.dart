import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/widgets/main_title.dart';

import '../../../core/const.dart';
import 'main_home_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({Key? key, required this.title})
      : super(
          key: key,
        );
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        kHeight,
        //!Error hasSize----{ note add expanded or LimitedBox}
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            separatorBuilder: (ctx, index) => kWidth,
            itemBuilder: (ctx, index) {
              return const MainHomeCard();
            },
          ),
        )
      ],
    );
  }
}
