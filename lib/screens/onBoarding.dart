import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
// storing the pages in an array.
  var pages = [
    PageViewModel(
      title: "OH NO! I AM GETTING FAT",
      body:
          "Suffering from fitness issues this quarantine?",
      image: Center(child: Image.asset("assets/screen_1.png", height: 175.0)),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w900),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        pageColor: Color(0xFF192A56),
      ),
    ),
    PageViewModel(
      title: "Not able to eat your favourite food?",
      body:
          "This app is right there for you!",
      image: Center(child: Image.asset("assets/screen2.png", height: 175.0)),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        pageColor: Color(0xFF192A56),
      ),
    ),
    PageViewModel(
      title: "Welcome to SoloFit",
      body:
          "This app contains a set of exercises to help you stay physically fit",
      image: Center(child: Image.asset("assets/screen3.png", height: 175.0)),
      decoration: const PageDecoration(
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        titleTextStyle: TextStyle(
            fontStyle: FontStyle.italic, color: Colors.white, fontSize: 25),
        pageColor: Color(0xFF192A56),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: pages, //the array
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
        // When done button is press
      },
      onSkip: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage()

          ),
        );
        // You can also override onSkip callback
      },
      showSkipButton: true,
          skip: Icon(
           Icons.skip_next,
        color: Colors.deepOrange,
        size: 30,
      ),
      next: Icon(Icons.navigate_next, color: Colors.deepOrange, size: 30),
      done: Text("Done",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.deepOrange)),
      dotsDecorator: DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          activeColor: Colors.deepOrange,
          color: Colors.white30,
          spacing:  EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    ));
  }
}
//PageViewModel(
//title: "Title of first page",
//body: "Here you can write the description of the page, to explain someting...",
//image: Center(child: Image.asset("res/images/logo.png", height: 175.0)),
//decoration: const PageDecoration(
//pageColor: Colors.blue,
//),
//)
