import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/Fast%20&%20Laugh/widget/video_list_item.dart';

class ScreenFastandLaugh extends StatelessWidget {
  const ScreenFastandLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index) {
            return VideoListItem(index: index);
          }),
        ),
      ),
    );
  }
}
