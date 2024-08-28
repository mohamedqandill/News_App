import 'dart:ui';
// business entertainment general health science sports technology

import 'package:flutter/material.dart';

class CategoriesData{
  String id;
  String title;
  Color color;
  String image;

  CategoriesData({
    required this.color,
    required this.id,
    required this.title,
    required this.image,
});
 static List<CategoriesData> categories=[
    CategoriesData(color: Colors.red, id: "sports", title: "Sports", image: "sports.png"),
    CategoriesData(color: Colors.blue, id: "general", title: "General", image: "Politics.png"),
    CategoriesData(color: Colors.pink, id: "health", title: "Health", image: "health.png"),
    CategoriesData(color: Colors.brown, id: "business", title: "Business", image: "bussines.png"),
    CategoriesData(color: Colors.indigoAccent, id: "entertainment", title: "Entertainment", image: "environment.png"),
    CategoriesData(color: Colors.yellow, id: "science", title:"Science", image: "science.png"),
  ];
}