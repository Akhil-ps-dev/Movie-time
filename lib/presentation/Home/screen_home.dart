import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/application/home/home_bloc.dart';
import 'package:flutter_movie_app/presentation/Home/widget/background_image.dart';
import 'package:flutter_movie_app/presentation/Home/widget/number_tile_card.dart';
import '../../core/const.dart';
import 'widget/main_title_card.dart';

ValueNotifier<bool> scrollDirectionVisible = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
      },
    );
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          'oops...Error While getting data',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    //releasesPastYear
                    final _releasesPastYear = state.pastYearMovieList.map(
                      (m) {
                        return '$imageAppendUrl${m.posterPath}';
                      },
                    ).toList();
                    _releasesPastYear.shuffle();
                    // trending
                    final _trending = state.trendingMovieList.map(
                      (m) {
                        return '$imageAppendUrl${m.posterPath}';
                      },
                    ).toList();
                    _trending.shuffle();
                    //tenseDramas
                    final _tensDrama = state.tenseDramaMovieList.map(
                      (m) {
                        return '$imageAppendUrl${m.posterPath}';
                      },
                    ).toList();
                    _tensDrama.shuffle();
                    //south indian
                    final _southIndia = state.southIndianMovieList.map(
                      (m) {
                        return '$imageAppendUrl${m.posterPath}';
                      },
                    ).toList();
                    _southIndia.shuffle();

                    return ListView(
                      children: [
                        const CustomBackgroundImage(),
                        MainTitleCard(
                          title: 'Released in Past year',
                          posterList: _releasesPastYear.sublist(0, 15),
                        ),
                        kHeight,
                        MainTitleCard(
                          posterList: _trending.sublist(0, 15),
                          title: 'Trending Now',
                        ),
                        kHeight,

                        ///! Number Card Widget
                        const NumberTileCard(),
                        kHeight,

                        MainTitleCard(
                          posterList: _tensDrama.sublist(0, 15),
                          title: 'Tense Dramas',
                        ),
                        kHeight,
                        MainTitleCard(
                          posterList: _southIndia.sublist(0, 15),
                          title: 'South Indians Cinema',
                        ),
                      ],
                    );
                  },
                ),
                scrollDirectionVisible.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png"),
                                          fit: BoxFit.cover)),
                                ),
                                kWidth
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Tv Shows',
                                  style: kHomeTileText,
                                ),
                                Text(
                                  'Movies',
                                  style: kHomeTileText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTileText,
                                )
                              ],
                            )
                          ],
                        ),
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
