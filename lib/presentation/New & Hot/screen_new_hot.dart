import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/presentation/Home/widget/custom_icon_widget.dart';
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
              _buildTabBarComingSoon(context),
              _buildTabBarEveryonesWatching("heyy"),
            ],
          )),
    );
  }

  Widget _buildTabBarComingSoon(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return ListView(
      children: [
        kHeight,
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "FEB",
                    style: TextStyle(fontSize: 15, color: kGrey),
                  ),
                  Text(
                    "11",
                    style: TextStyle(
                        letterSpacing: 5,
                        fontSize: 40,
                        color: kWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - 50,
              height: 500,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          kTemporatyImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          radius: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_off_rounded,
                              color: kWhite,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          "TALL GIRL",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      CustomIconWidger(
                        icon: Icons.notifications,
                        text: "bell",
                        textSize: 20,
                        fontSize: 10,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomIconWidger(
                        icon: Icons.info,
                        text: "Info",
                        textSize: 20,
                        fontSize: 10,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildTabBarEveryonesWatching(String name) {
    return Center(
      child: Text("$name"),
    );
  }
}
