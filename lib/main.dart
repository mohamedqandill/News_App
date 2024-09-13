import 'package:flutter/material.dart';
import 'package:news_app/modules/screens/home/home_screen.dart';
import 'package:news_app/modules/screens/news_details.dart';
import 'package:news_app/modules/screens/news_screen.dart';

import 'modules/splashs/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Flutter Demo',
      // home: NewsScreen(),

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        NewsDetails.routeName:(_)=>NewsDetails(),
      },



    );
  }
}

