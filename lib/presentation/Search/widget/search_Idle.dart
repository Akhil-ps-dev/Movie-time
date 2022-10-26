import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/application/search/search_bloc.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/core/const.dart';
import 'package:flutter_movie_app/presentation/Search/widget/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text("oops something went wrong please try again"),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text("The list is empty "),
                );
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((ctx, index) {
                    final movie = state.idleList[index];

                    return TopSearchItemTile(
                        title: movie.title ?? 'no title find',
                        imageUrl: "$imageAppendUrl${movie.posterPath}");
                  }),
                  separatorBuilder: ((ctx, index) => kHeight20),
                  itemCount: state.idleList.length,
                );
              }
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidht = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidht * 0.35,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(
          Icons.play_circle_outline_rounded,
          color: kWhite,
          size: 45,
        )
      ],
    );
  }
}
