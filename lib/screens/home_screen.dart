import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exercise_hub.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'exercise_start_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiURL =
      'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json#';

  ExerciseHub exerciseHub;

  @override
  void initState() {
    setState(() {
      getExercises();
    });
    // TODO: implement initState
    super.initState();
  }

  Future<ExerciseHub> getExercises() async {
    var response = await http.get(apiURL);
    var body = response.body;
    var decodedJson = jsonDecode(body);
    exerciseHub = ExerciseHub.fromJson(decodedJson);
    setState(()
    {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
        backgroundColor: Color(0xFF192A56),
      ),
      body: Container(
          child: exerciseHub != null
              ?( Scrollbar(
               controller: ScrollController(),
                child: ListView(

                    children: exerciseHub.exercises.map((e) {
                      return InkWell(  //beware: not Inkwell
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ExerciseStartScreen(exercises: e);// e object passed to exercises parameter
                          }));
                        },
                        child: Hero(
                          tag: e.id,//unique id to send info across pages. here id is accessed from the json
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FadeInImage(
                                    image: NetworkImage(e.thumbnail),
                                    placeholder: AssetImage('assets/placeholder.jpg'),
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),

                                ),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.center,//here transparent allowing to reject gradient covering the image.(issue)
                                            colors: [Colors.black, Colors.transparent])),
                                  ),
                                ),
                                Container(
                                  height: 250,
                                    padding: EdgeInsets.only(left: 12,bottom: 5),
                                  child: Text(
                                    e.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.bold,

                                    ),

                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
              )
          ): LinearProgressIndicator()
      ), //completing the else statement by an LPI
    );
  }
}
