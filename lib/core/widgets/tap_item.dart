import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/news_model.dart';

import '../../models/SourceResponse.dart';

class TapItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TapItem({required this.source,required this.isSelected,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      alignment: Alignment.center,
      height: 42,
        width: 120,
        decoration: BoxDecoration(
          color: isSelected?Colors.green:Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: !isSelected?Colors.green:Colors.transparent,width: !isSelected?3:0)
        ),
        child: Text(source.name??"",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),));
  }
}
