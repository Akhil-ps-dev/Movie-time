import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/application/fast_Laugh/fast_laugh_bloc.dart';
import 'package:flutter_movie_app/application/search/search_bloc.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/presentation/Fast%20&%20Laugh/widget/video_list_item.dart';

class ScreenFastandLaugh extends StatelessWidget {
  const ScreenFastandLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            } else if (state.isError) {
              return const Center(
                  child: Icon(
                Icons.wifi_off,
                size: 50,
                color: kGrey,
              ));
            } else if (state.videoList.isEmpty) {
              return const Center(child: Text('Videl List Empty!'));
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videoList.length, (index) {
                  return VideoListItemInheritedWidget(
                      widget: VideoListItem(
                          key: Key(index.toString()), index: index),
                      movieData: state.videoList[index]);
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
