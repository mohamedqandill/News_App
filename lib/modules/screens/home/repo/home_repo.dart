
import 'package:news_app/core/services/Apis/api_manager.dart';

import '../../../../models/SourceResponse.dart';
import '../../../../models/news_model.dart';

abstract class HomeRepo{

  Future<NewsModels> getNews(String sourceId);

  Future<SourceResponse>getSources(String id);
}