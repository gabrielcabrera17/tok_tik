import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/config/helpers/human_formats.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key, 
    required this.video
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIcomButtons(value: video.likes, iconColor: Colors.red, iconData: Icons.favorite),
        const SizedBox(height: 20),
        _CustomIcomButtons(value: video.views, iconData: Icons.remove_red_eye_outlined, iconColor: Colors.white),
        const SizedBox(height: 20),
        SpinPerfect(
          duration: const Duration(seconds: 5),
          child: const _CustomIcomButtons(value: 0, iconData: Icons.play_circle_outlined)
        )
      ],
    );
  }
}


class _CustomIcomButtons extends StatelessWidget {
  //CANTIDAD DE LIKES O VIEWS
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIcomButtons({
    required this.value, 
    required this.iconData, 
    iconColor
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, 
        icon: Icon(iconData, color: color, size: 30)),

        if(value >0)
        Text(HumanFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}

