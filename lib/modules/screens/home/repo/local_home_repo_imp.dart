import 'package:news_app/core/services/cache_helper/cache_helper.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/screens/home/repo/home_repo.dart';

class LocalHomeRepoImp implements HomeRepo{
  @override
  Future<NewsModels> getNews(String sourceId) {
    return CacheHelper.getNews();
  }

  @override
  Future<SourceResponse> getSources(String id) {
    return CacheHelper.getSources();

  }

}