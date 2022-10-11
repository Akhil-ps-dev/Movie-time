import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/const.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/q7XOgkp0NfjqVRYxzU0eGg7wSrm.jpg';

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Searces',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((ctx, index) => TopSearchItemTile()),
              separatorBuilder: ((ctx, index) => kHeight),
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
          width: screenWidht * 0.3,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover),
          ),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        )
      ],
    );
  }
}
