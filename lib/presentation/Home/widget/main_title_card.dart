import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/widgets/main_title.dart';

import '../../../core/const.dart';
import 'main_home_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({Key? key, required this.title, required this.posterList})
      : super(
          key: key,
        );
  final String title;
  final List<String> posterList;
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
            itemCount: posterList.length,
            separatorBuilder: (ctx, index) => kWidth,
            itemBuilder: (ctx, index) {
              return MainHomeCard(
                imageUrl: posterList[index],
              );
            },
          ),
        )
      ],
    );
  }
}
