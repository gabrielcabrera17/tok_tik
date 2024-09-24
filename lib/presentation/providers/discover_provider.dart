import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_post_repositories.dart';


class DiscoverProvider extends ChangeNotifier {
 //todo: Repository, DataSource

  final VideoPostRepository videosRepository;


  bool initialLoading = true;
  List <VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});


  Future<void> loadNextPage() async {

    //await Future.delayed(const Duration(seconds: 2));

    /*final List<VideoPost> newVideos = videoPosts.map( ( video ) => 
    LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
    ).toList();*/

    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    //todo: cargar videos
    videos.addAll(newVideos);    
    initialLoading  = false;
    notifyListeners();
  }

}