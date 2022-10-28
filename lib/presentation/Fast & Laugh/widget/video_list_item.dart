import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/core/const.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../application/fast_Laugh/fast_laugh_bloc.dart';
import '../../../domain/downloads/models/downloads.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {key, required this.widget, required this.movieData})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrl[index % dummyVideoUrl.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(onStateChanged: (bool) {}, videoUrl: videoUrl),
        //!we use Align or positioned to row and column.. [inside the stack]
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_rounded,
                      color: kWhite,
                      size: 30,
                    ),
                  ),
                ),
                //right
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                        radius: 30,
                      ),
                    ),
                    VideoActionWidgets(
                      icon: Icons.emoji_emotions,
                      title: 'LOL',
                    ),
                    VideoActionWidgets(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .title;
                        //if error add posterPath instead of title
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: VideoActionWidgets(
                        icon: Icons.share,
                        title: 'Share',
                      ),
                    ),
                    VideoActionWidgets(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidgets extends StatelessWidget {
  const VideoActionWidgets(
      {super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhite,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.onStateChanged, required this.videoUrl});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
