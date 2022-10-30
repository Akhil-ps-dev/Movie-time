import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
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
        body: TabBarView(
          children: [
            ComingSoonListWidget(
              key: Key('coming_soon'),
            ),
            EveryOneIsWatchingList(),
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
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
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
            itemBuilder: (context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              return ComingSoonWidget(
                id: movie.id.toString(),
                month: 'MAY',
                day: '21',
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'No Title',
                description: movie.overview ?? 'No Description',
              );
            },
            itemCount: state.comingSoonList.length,
          );
        }
      },
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
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
            child: Text("Coming SOON list is empty "),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final movie = state.everyOneIsWatchingList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              return EveryonesWatchingWidget(
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'No Title',
                description: movie.overview ?? 'No Description',
              );
            },
            itemCount: state.everyOneIsWatchingList.length,
          );
        }
      },
    );
  }
}
