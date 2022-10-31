import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:intl/intl.dart';
import '../../core/const.dart';
import 'Widget/coming_soon_widget.dart';
import 'Widget/everyones_watching.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'Hot & New',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
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
                        "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              kWidth
            ],
            bottom: TabBar(
              unselectedLabelColor: kWhite,
              labelColor: kBlack,
              isScrollable: true,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              indicator: BoxDecoration(
                color: kWhite,
                borderRadius: kBorderR30,
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonListWidget(
              key: Key('coming_soon'),
            ),
            EveryOneIsWatchingListWidget(
              key: Key('everyone_iswatching'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComingSoonListWidget extends StatelessWidget {
  const ComingSoonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      return BlocProvider.of<HotAndNewBloc>(context)
          .add(LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async { 
        return BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("oops something went wrong please try again"),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text("Coming SOON list is empty "),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                // print(movie.releaseDate);
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formatedDate =
                      DateFormat.yMMMMd('en_US').format(_date!);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No Description',
                );
              },
              itemCount: state.comingSoonList.length,
            );
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingListWidget extends StatelessWidget {
  const EveryOneIsWatchingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      return BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
    });
    //refresh indicator (swipe to refresh)
    return RefreshIndicator(
      onRefresh: () async {
        return BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("oops something went wrong please try again"),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text("  list is empty "),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                // print(movie.releaseDate);

                final tv = state.everyOneIsWatchingList[index];
                return EveryonesWatchingWidget(
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: tv.originalName ?? 'No Title',
                  description: tv.overview ?? 'No Description',
                );
              },
              itemCount: state.everyOneIsWatchingList.length,
            );
          }
        },
      ),
    );
  }
}
