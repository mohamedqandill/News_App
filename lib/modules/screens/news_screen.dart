import 'package:flutter/material.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/core/services/Apis/api_manager.dart';
import 'package:news_app/core/widgets/bg_widget/custom_bg.dart';
import 'package:news_app/core/widgets/tap_bar.dart';
import 'package:news_app/core/widgets/tap_item.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/Manager/home_view_model.dart';

class NewsScreen extends StatefulWidget {
  HomeCubit cubit;
  static const String routeName="news";

   NewsScreen({required this.cubit,super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedIndex=0;


  @override
  Widget build(BuildContext context) {

    return Custom_Bg(

      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   centerTitle: true
        //   ,
        //   backgroundColor: Colors.green,title: Text("News App"),),
        body:TapBar(cubit: widget.cubit,)
      ),
    );
  }
}



