import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';
import 'package:flutter_movie_app/presentation/widgets/app_bar_widget.dart';

import '../../core/const.dart';

class ScreenDowloads extends StatelessWidget {
  ScreenDowloads({super.key});
  final _widgetList = [
    const _SmartDownloadWidget(),
    Section2(),
    const Section3()
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: ((ctx, index) => _widgetList[index]),
            separatorBuilder: ((ctx, index) => const SizedBox(
                  height: 25,
                )),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imagesList = [
    // "https://upload.wikimedia.org/wikipedia/en/e/e4/Paappan_%282022_movie_poster%29.jpg"
    "https://m.media-amazon.com/images/I/71niXI3lxlL._SY679_.jpg"
        "https://m.media-amazon.com/images/I/71niXI3lxlL._SY679_.jpg"
        "https://m.media-amazon.com/images/I/71niXI3lxlL._SY679_.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Download for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhite,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We Will download a personalised selection of\nmovies and show for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kGrey,
            fontSize: 16,
          ),
        ),
        kHeight,

        //TODO IMAGE - STACK - ROTATE
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: kGrey.withOpacity(0.5),
              ),

              //!right image
              DownloadImageWidget(
                imagesList: imagesList[0],
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 170,
                ),
                size: Size(
                  size.width * 0.35,
                  size.width * 0.55,
                ),
                angle: 25,
              ),
              //!left image

              DownloadImageWidget(
                imagesList: imagesList[0],
                margin: const EdgeInsets.only(
                  top: 50,
                  right: 170,
                ),
                size: Size(
                  size.width * 0.35,
                  size.width * 0.55,
                ),
                angle: -25,
              ),
              //!middle image
              DownloadImageWidget(
                imagesList: imagesList[0],
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 0,
                  bottom: 40,
                ),
                size: Size(size.width * 0.4, size.width * 0.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//buttons
class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            color: kButtonBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          color: kButtonWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'See What you can download',
              style: TextStyle(
                color: kBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloadWidget extends StatelessWidget {
  const _SmartDownloadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {Key? key,
      this.angle = 0,
      required this.imagesList,
      required this.size,
      required this.margin})
      : super(key: key);

  final String imagesList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          // margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imagesList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
