import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/bg_widget/custom_bg.dart';
import 'package:news_app/modules/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),() {
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
    },);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Custom_Bg(

      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(
          child: Image(image: AssetImage("assets/images/logo.png"),),

        ),

      ),
    );
  }
}
