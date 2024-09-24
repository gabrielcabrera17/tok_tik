import 'package:tok_tik/domain/datasources/video_posts_datasource.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_post_repositories.dart';
//import 'package:tok_tik/infrastructure/datasources/local_video_datasource_impl.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  //aqui lo único que le pedimos es que nos manden un origen de dato 
  // y yo simplemente procedere a llamar esos origenes de datos
  //permite cualquier videoPost: locales, web, json, etc.
  final VideoPostsDatasource videosDataource;

  VideoPostsRepositoryImpl({
    required this.videosDataource, 
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
   return videosDataource.getTrendingVideosByPage(page);
  }

}