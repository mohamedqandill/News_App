
import 'package:flutter/material.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/core/widgets/news_item.dart';
import 'package:news_app/modules/Manager/home_view_model.dart';

class CustomSearch  extends SearchDelegate{
  HomeCubit? cubit;
  CustomSearch(this.cubit);


  List<String> title=[
    "a",
    "g",
    "f",
    "c",
    "d",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        showResults(context);
      }
          , icon:Icon(Icons.search) )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {



    return ListView.builder(
      itemCount: cubit?.article.length,

      itemBuilder: (context, index) {

        print("===========${cubit?.article}");
        // cubit?.getNews(q: query);
        return NewsItem(
          article: cubit?.article[index],
          cubit: cubit,

        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    HomeCubit? cubit=HomeCubit();
    return Text("ads");
  }


}