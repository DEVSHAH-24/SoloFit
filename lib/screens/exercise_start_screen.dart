import 'dart:math';

import 'package:flutter/material.dart';
import 'exercise_screen.dart';
import 'package:solofit/screens/exercise_hub.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'home_screen.dart';
import 'onBoarding.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;
  ExerciseStartScreen({this.exercises});
  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: widget.exercises.thumbnail,
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.exercises.thumbnail,
              placeholder: (context, url) => Image(
                image: AssetImage('assets/placeholder.jpg'),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              errorWidget: (context, url, error) {
                return Icon(Icons.error);
              },
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.white, Colors.transparent]),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                width: 200,
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                      animationEnabled: false,
                      customColors: CustomSliderColors(
                          progressBarColors: [Colors.green, Colors.white])
                      // spinnerMode: true,
                      ),
                  onChange: (double value) {
                    seconds = value.toInt();
                  },
                  initialValue: 30,
                  max: 60,
                  min: 10,
                  innerWidget: (v) {
                    //widget inside the arc.
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${v.toInt()} Sec",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.lightGreen[100],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  splashColor: Colors.red,
                  color: Colors.green[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Text(
                    "Start Workout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ExerciseScreen(
                        exercises: widget.exercises,
                        seconds: seconds,
                      );
                    }));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
