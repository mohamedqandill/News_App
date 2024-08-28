import 'package:flutter/material.dart';

class Custom_Bg extends StatelessWidget {
  Widget child;
   Custom_Bg({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover
          )
      ),
      child: child,
    );
  }
}
