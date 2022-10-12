import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/core/const.dart';
import 'package:flutter_movie_app/presentation/Search/widget/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/q7XOgkp0NfjqVRYxzU0eGg7wSrm.jpg';

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitleWidget(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((ctx, index) => TopSearchItemTile()),
              separatorBuilder: ((ctx, index) => kHeightTwenty),
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidht = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidht * 0.35,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Icon(
          Icons.play_circle_outline_rounded,
          color: kWhite,
          size: 45,
        )
      ],
    );
  }
}
