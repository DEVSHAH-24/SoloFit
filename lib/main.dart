import 'package:flutter/material.dart';
import 'screens/onBoarding.dart';
void main(){
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF192A56),
        )
      ) ,
     // theme: ThemeData.dark(),
      title: 'SoloFit',
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
