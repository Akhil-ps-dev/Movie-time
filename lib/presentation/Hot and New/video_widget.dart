import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(
            url,
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
    );
  }
}
