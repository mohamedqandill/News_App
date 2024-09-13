


import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart'as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/screens/home/repo/home_repo.dart';
import 'package:news_app/modules/screens/home/repo/local_home_repo_imp.dart';
import 'package:news_app/modules/screens/home/repo/remote_home_repo_imp.dart';

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
  late HomeRepo homeRepo;




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


   Future<void> getNews()async{

     emit(getNewsLoadingState());

     bool isConnected = await InternetConnectionChecker().hasConnection;
     if(isConnected){
       homeRepo=RemoteHomeRepoImp();
     }
     else{
       homeRepo=LocalHomeRepoImp();
     }

  try{

   newsModels = await homeRepo.getNews(sources[selectedIndex].id!);
    article =newsModels?.articles??[];
    emit(getNewsSuccesState());
  }
  catch(e){
    emit(getNewsErrorState(e.toString()));

  }


  }

   Future<void>getSources()async{

     emit(getSourcesLoadingState());
     bool isConnected = await InternetConnectionChecker().hasConnection;
     if(isConnected){
       homeRepo=RemoteHomeRepoImp();
     }
     else{
       homeRepo=LocalHomeRepoImp();
     }
  try{

   sourceResponse= await homeRepo.getSources(selectedCategory?.id??"");
    sources= sourceResponse?.sources??[];
    emit(getSourcesSuccesState());
    getNews();
  }
  catch(e){
    emit(getSourcesErrorState(e.toString()));

  }
  }
}