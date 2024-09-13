import 'package:news_app/core/services/Apis/api_manager.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/screens/home/repo/home_repo.dart';

class RemoteHomeRepoImp implements HomeRepo{
  @override
   Future<NewsModels> getNews(String sourceId)async {
    return await ApiManager.getNews(sourceId:sourceId);
  }

  @override
  Future<SourceResponse> getSources(String id) async{
    return ApiManager.getSources(id);
  }

}