import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/services/cache_helper/cache_helper.dart';
import 'package:news_app/models/SourceResponse.dart';

import '../../../models/news_model.dart';

class ApiManager{

  static Future<NewsModels> getNews({String? sourceId, String? q})async{



    Uri url= Uri.https("newsapi.org","v2/everything",{
      "q":q,
      "sources":sourceId,
      "apiKey":"5e79c36d53de428bb2965242ea0a604d"
    });


    http.Response response=await http.get(url);

    var json=jsonDecode(response.body);

    var data=await NewsModels.fromJson(json);
    CacheHelper.saveNews(data);
    return data;

  }
  
  
   static Future<SourceResponse>getSources(String id)async{

    Uri url=Uri.https("newsapi.org","v2/top-headlines/sources",{
      "apiKey":"5e79c36d53de428bb2965242ea0a604d",
      "category":id

    });
    http.Response response= await http.get(url);

    var json=jsonDecode(response.body);
    var data =await SourceResponse.fromJson(json);
    CacheHelper.saveSources(data);
    return data;
  }


}