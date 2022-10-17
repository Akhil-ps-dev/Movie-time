import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/presentation/widgets/app_bar_widget.dart';

import '../../core/const.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
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
              _buildTabBarView('🍿 Coming Soon'),
              _buildTabBarView("👀 Everyone's Watching"),
            ],
          )),
    );
  }

  _buildTabBarView(String name) {
    return Center(
      child: Text("$name"),
    );
  }
}
