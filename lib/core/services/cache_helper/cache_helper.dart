

import 'dart:io';

import 'package:hive/hive.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class CacheHelper {

 static Future<void> saveSources(SourceResponse sourceResponse)async{


  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final collection = await BoxCollection.open(
   'News', // Name of your database
   {'Sources'}, // Names of your boxes
   path: appDocumentsDir.path, // Path where to store your boxes (Only used in Flutter / Dart IO)
  );

  final catsBox =await collection.openBox<Map>('Sources');

  await catsBox.put("sourceResponse", sourceResponse.toJson());


 }

 static Future<SourceResponse> getSources()async{

  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  final collection = await BoxCollection.open(
   'News', // Name of your database
   {'Sources'}, // Names of your boxes
   path: appDocumentsDir.path, // Path where to store your boxes (Only used in Flutter / Dart IO)
  );

  final catsBox =await collection.openBox<Map>('Sources');

 var json= await catsBox.get("sourceResponse");

 return  await SourceResponse.fromJson(json);

 }




 static Future<void> saveNews(NewsModels newsModels)async{


  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final collection = await BoxCollection.open(
   'News', // Name of your database
   {'NewsData'}, // Names of your boxes
   path: appDocumentsDir.path, // Path where to store your boxes (Only used in Flutter / Dart IO)
  );

  final catsBox =await collection.openBox<Map>('NewsData');

  await catsBox.put("newsModel", newsModels.toJson());


 }

 static Future<NewsModels> getNews()async{

  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  print(appDocumentsDir.path);
  final collection = await BoxCollection.open(
   'News', // Name of your database
   {'NewsData'}, // Names of your boxes
   path: appDocumentsDir.path, // Path where to store your boxes (Only used in Flutter / Dart IO)
  );

  final catsBox =await collection.openBox<Map>('NewsData');

  var json= await catsBox.get("newsModel");

  return  await NewsModels.fromJson(json);

 }

}