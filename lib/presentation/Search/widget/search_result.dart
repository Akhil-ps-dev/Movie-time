import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_movie_app/core/const.dart';
import 'package:flutter_movie_app/presentation/Search/widget/title.dart';

const imageUrl = "https://m.media-amazon.com/images/I/71niXI3lxlL._SY679_.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(
          title: 'Movies & Tv',
        ),
        kHeight,
        Expanded(
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              //!width / height
              childAspectRatio: 1 / 1.4,
              children: List.generate(20, (index) {
                return const MainCard();
              })),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
        ),
        borderRadius: BorderRadius.circular(
          7,
        ),
      ),
    );
  }
}
