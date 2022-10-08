import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/presentation/Fast%20&%20Laugh/screen_fast_laugh.dart';
import 'package:flutter_movie_app/presentation/Home/screen_home.dart';
import 'package:flutter_movie_app/presentation/New%20&%20Hot/screen_new_hot.dart';
import 'package:flutter_movie_app/presentation/Search/screen_search.dart';
import 'package:flutter_movie_app/presentation/downloads/screen_download.dart';
import 'package:flutter_movie_app/presentation/main_page/widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewandHot(),
    ScreenFastandLaugh(),
    ScreenSearch(),
    ScreenDowloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext context, int index, Widget? _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
