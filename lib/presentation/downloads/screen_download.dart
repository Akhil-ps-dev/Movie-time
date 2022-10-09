import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/presentation/widgets/app_bar_widget.dart';

import '../../core/colors/colors.dart';

class ScreenDowloads extends StatelessWidget {
  ScreenDowloads({super.key});
  final List imagesList = [
    // "https://upload.wikimedia.org/wikipedia/en/e/e4/Paappan_%282022_movie_poster%29.jpg"
    "https://m.media-amazon.com/images/I/71niXI3lxlL._SY679_.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              Icon(
                Icons.settings,
                color: kWhite,
              ),
              Text(
                'Smart Donwload',
                style: TextStyle(color: kWhite),
              ),
            ],
          ),
          const Text(
            'Introducing Download for you',
            style: TextStyle(color: kWhite),
          ),
          const Text(
            'We Will download a personalised selection of movies and show for you, so there is always something to watch on your device',
            style: TextStyle(color: kWhite),
          ),

          //TODO IMAGE - STACK - ROTATE
          Container(
            color: Colors.white,
            width: size.width,
            height: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.37,
                ),
                Container(
                  width: size.width * 0.4,
                  height: size.width * 0.58,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imagesList[0],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          MaterialButton(
            color: kButtonBlue,
            onPressed: () {},
            child: const Text(
              'Setup',
              style: TextStyle(
                  color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          MaterialButton(
            color: kButtonWhite,
            onPressed: () {},
            child: const Text(
              'See What you can download',
              style: TextStyle(
                  color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
