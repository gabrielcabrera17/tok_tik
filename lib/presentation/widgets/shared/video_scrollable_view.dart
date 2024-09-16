 
import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    //el builder construira bajo demanda
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder:(context, index) {

        //instancia de VideoPost
        final videoPost = videos[index];

        return Stack(
          children: [
            //video player + gradiente
           SizedBox.expand(
            child: FullScreenPlayer(
              caption: videoPost.caption,
              videoUrl: videoPost.videoUrl,
            )
           ),

            //botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            ),
          ],
        );
      } ,
     
    );
  }
}