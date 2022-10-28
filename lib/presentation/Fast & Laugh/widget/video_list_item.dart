import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/colors/colors.dart';



class VideoListItemInheritedWidget extends VideoListItem{

  
  VideoListItemInheritedWidget({required super.index});


}



class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
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
                    VideoActionWidgets(
                      icon: Icons.share,
                      title: 'Share',
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
