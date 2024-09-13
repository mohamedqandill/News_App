import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/screens/news_details.dart';

import '../../modules/Manager/home_view_model.dart';

class NewsItem extends StatefulWidget {
  NewsItem({this.cubit, this.article, super.key});
  HomeCubit? cubit=HomeCubit();
  Article? article;

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,
            arguments: widget.article);
        setState(() {});
      },
      child: Container(

        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
            // color: Colors.grey.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  // height: 270,

                  imageUrl: widget.article?.urlToImage ?? "",
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              // ClipRRect(
              //     borderRadius: BorderRadius.circular(20),
              //     child: Image.network.article.urlToImage??"")),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.article?.author?.substring(0, 7) ?? "",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.article?.publishedAt?.substring(0, 10) ?? "",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.article?.title ?? "",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
              ),

              // Text(widget.article.content??"",style: TextStyle(),),

            ],
          ),
        ),
      ),
    );
  }
}


