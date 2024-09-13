import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/bg_widget/custom_bg.dart';
import 'package:news_app/core/widgets/news_item.dart';
import 'package:news_app/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Manager/home_view_model.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName="details";
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Article data=ModalRoute.of(context)?.settings.arguments as Article;
    return Custom_Bg(

        child: Scaffold(
          appBar: AppBar(
            title: Text(data.title??""),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(data.urlToImage??"")),
                  SizedBox(height: 10,),
                  Text(data.source?.name??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  SizedBox(height: 6,),
                  Text(data.description??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 30,),
                  Text(data.content??"",style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20,),

                  InkWell(
                    onTap: (){
                      _launchUrl(data.url??"");

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("View Full Article",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward_ios_outlined,size: 23,)
                      ],
                    ),
                  )



                ],
              ),
            ),
          ),

    ));
  }


  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }



}


