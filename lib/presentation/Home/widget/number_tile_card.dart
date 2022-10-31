import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/Home/widget/number_card.dart';

import '../../../core/const.dart';
import '../../widgets/main_title.dart';

class NumberTileCard extends StatelessWidget {
  final List<String> posterList;

  const NumberTileCard({super.key, required this.posterList});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                imageUrl: posterList[index],
              );
            },
          ),
        )
      ],
    );
  }
}
