


import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart'as http;
import 'package:news_app/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/news_model.dart';

import '../models/categories_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :super(HomeinitState());
  static HomeCubit get(context)=>BlocProvider.of(context);




  SourceResponse? sourceResponse;
  NewsModels? newsModels;
  CategoriesData? selectedCategory=null;
  List<Sources> sources=[];
  List<Article> article=[];
  int selectedIndex=0;




  onSelectedCategory(cat){
    selectedCategory=cat;
    emit(HomeSelectedCategoriesState());
  }

  onTapClicked(val){
    selectedIndex=val;
    getNews();
    emit(HomeTapClickedState());
  }
  resetData(){
    selectedIndex=0;
    article=[];
    sources=[];
    selectedCategory=null;
    emit(HomeresetDataState());

  }


   Future<void> getNews({String? q})async{



  try{
    emit(getNewsLoadingState());
    Uri url= Uri.https("newsapi.org","v2/everything",{

      "sources":sources[selectedIndex].id,
      "q":q,
      "apiKey":"5e79c36d53de428bb2965242ea0a604d"
    });


    http.Response response=await http.get(url);

    var json=jsonDecode(response.body);
    newsModels =NewsModels.fromJson(json);
    if(response.statusCode !=200){
      emit(getNewsErrorState(newsModels?.message??""));
      return;
    }
    article =newsModels?.articles??[];
    emit(getNewsSuccesState());
  }
  catch(e){
    emit(getNewsErrorState(e.toString()));

  }


  }

   Future<void>getSources()async{

  try{
    emit(getSourcesLoadingState());
    Uri url=Uri.https("newsapi.org","v2/top-headlines/sources",{
      "apiKey":"5e79c36d53de428bb2965242ea0a604d",
      "category":selectedCategory?.id??""

    });
    http.Response response= await http.get(url);

    var json=jsonDecode(response.body);
    sourceResponse=SourceResponse.fromJson(json);
    if(response.statusCode !=200){
      emit(getSourcesErrorState(sourceResponse?.message??""));
      return;
    }
    sources= sourceResponse?.sources??[];
    emit(getSourcesSuccesState());
    getNews();
  }
  catch(e){
    emit(getSourcesErrorState(e.toString()));

  }
  }
}