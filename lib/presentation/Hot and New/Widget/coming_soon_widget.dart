import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/const.dart';
import '../../Home/widget/custom_icon_widget.dart';
import '../video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  month,
                  style: const TextStyle(fontSize: 15, color: kGrey),
                ),
                Text(
                  day,
                  style: const TextStyle(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(
                  url: posterPath,
                ),
                kHeight,
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const CustomIconWidger(
                      icon: Icons.notifications_none,
                      text: "Remind me",
                      iconSize: 25,
                      fontSize: 16,
                      color: kGrey,
                    ),
                    kWidth20,
                    const CustomIconWidger(
                      icon: Icons.info_outline_rounded,
                      text: "Info",
                      iconSize: 25,
                      fontSize: 16,
                      color: kGrey,
                    ),
                    kWidth20
                  ],
                ),
                kHeight,
                Text(
                  "Coming on $day $month",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                kHeight,
                Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                kHeight,
                Container(
                  width: 50,
                  height: 30,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/87fe7c9f-a6f4-42d3-96fd-9924de610773/desqd6x-fa144654-6da3-4fc9-aace-be1b86c11fca.png/v1/fill/w_1280,h_608,strp/netflix_film_logo_by_ethanishere_desqd6x-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjA4IiwicGF0aCI6IlwvZlwvODdmZTdjOWYtYTZmNC00MmQzLTk2ZmQtOTkyNGRlNjEwNzczXC9kZXNxZDZ4LWZhMTQ0NjU0LTZkYTMtNGZjOS1hYWNlLWJlMWI4NmMxMWZjYS5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.-H6J4CP0lKa26Mpb4MOgG28TRCdFMxa7vivFj1uMuD4'))),
                ),
                Text(
                  description,
                  maxLines: 5,
                  style: TextStyle(color: kGrey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
