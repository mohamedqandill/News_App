import 'package:flutter/material.dart';
import 'package:news_app/models/categories_model.dart';

class CustomContainerCategories extends StatelessWidget {
  final CategoriesData categorie;
  bool isRight;
    CustomContainerCategories({required this.isRight, required this.categorie,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 160,
      height: 188,
      decoration: BoxDecoration(
          color: categorie.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft:!isRight? Radius.zero:Radius.circular(25),
            bottomRight: !isRight?Radius.circular(25):Radius.zero,
          )
      ),
      child: Column(
        children: [
          Image.asset("assets/images/${categorie.image}"),
          Spacer(),
          Text(categorie.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
          Spacer()



        ],
      ),
    );
  }
}
