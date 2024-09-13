//
// import 'package:flutter/cupertino.dart';
// import 'package:news_app/core/services/Apis/api_manager.dart';
// import 'package:news_app/models/SourceResponse.dart';
// import 'package:news_app/models/categories_model.dart';
// import 'package:news_app/models/news_model.dart';
// import 'package:news_app/modules/Manager/home_connector.dart';
//
// class HomeViewModel extends ChangeNotifier{
//
//   CategoriesData? selectedCategory=null;
//   List<Sources> sources=[];
//   List<Article> article=[];
//   int selectedIndex=0;
//   HomeConnector? connector;
//
//
//   onSelectedCategory(cat){
//     selectedCategory=cat;
//     notifyListeners();
//   }
//
//   onTapClicked(val){
//     selectedIndex=val;
//     getNews();
//     notifyListeners();
//   }
//
//   getSources()async{
//     connector!.showLoading();
//     var data=await ApiManager.getSources(selectedCategory?.id??"");
//    sources=data.sources??[];
//     connector!.hideDialog();
//     await getNews();
//
//
//    notifyListeners();
//   }
//
//   getNews({String? q})async{
//     // connector!.showLoading();
//     var data=await ApiManager.getNews(sourceId: sources[selectedIndex].id??"",q: q);
//     article=data.articles;
//     // connector!.hideDialog();
//     notifyListeners();
//
//   }
//
//
// }
//
// class NewsDesc {
//   String image;
//   String desc;
//   String content;
//   String source;
//   String title;
//
//
//   NewsDesc(this.image, this.desc, this.content, this.source,this.title);
// }