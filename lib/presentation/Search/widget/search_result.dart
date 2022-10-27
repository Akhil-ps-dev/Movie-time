import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/application/search/search_bloc.dart';
import 'package:flutter_movie_app/core/const.dart';
import 'package:flutter_movie_app/presentation/Search/widget/title.dart';

class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({super.key});

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  //!width / height
                  childAspectRatio: 1 / 1.4,
                  children: List.generate(20, (index) {
                    final movie = state.searchResultList[index];

                    return MainCard(imageUrl: movie.posterImageUrl);
                  }));
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
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
