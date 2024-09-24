import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl, 
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      //que los videos se reproduzcan ciclicamente 
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //para acceder a propiedades del satefulWidget widget.
    //widget.caption;
    return FutureBuilder(
      future: controller.initialize(), 
      //El snapshot es el estado de el future
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done){
        return const Center(child: CircularProgressIndicator(strokeWidth: 2,));
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading video'));
        }


        //video a reproducir
        return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            children:[

              VideoPlayer(controller),

              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption),
              ),
            ]
          ),
        );
      },
    );
  }
}


class _VideoCaption extends StatelessWidget {

  final String caption;


  const _VideoCaption({
    super.key, 
    required this.caption
  });

  @override
  Widget build(BuildContext context) {

    //hace referencia al mismo
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width *0.6,
      child: Text(caption, maxLines: 2),
    );
  }
}