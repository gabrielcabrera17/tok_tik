import 'package:tok_tik/domain/entities/video_post.dart';

abstract class VideoPostsDatasource {

  //al llamar getFavoriteVideosByUser yo cargare los videos favoritos del usuarios
  //sin importar de donde vengan esos videos.

  Future<List<VideoPost>> getFavoriteVideosByUser(String userID);

  // al datasource no le importa como se implementa de este metodo
  // simplemente le dice que regresa un future que regresa una lista de videoPost
  Future<List<VideoPost>> getTrendingVideosByPage(int page);

}