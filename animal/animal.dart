/*
* NAME OF CODE ARTIFACT - animal.dart
* BRIEF DESCRIPTION - Implimented animal page 
* PROGRAMMERS NAME - Jowaki Merani
* DATE CODE CREATED - Feb 23
* DATE REVISED - February 23
                 Jowaki Merani - merged animal for feelings animal 
                 March 9th
                 Parveen Kaur - added proper navigation between pages
* KNOWN FAULT - None
*/
import 'package:flutter/material.dart';
// import 'package:flare_flutter/flare_actor.dart';
import 'package:rive/rive.dart';

import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/journal_page.dart';
import 'package:flutter_application_1/personal%20details/profileMenu_page.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:rive/rive.dart';

import '../DemoApp.dart';
import '../games/games_meanu_pg.dart';
import '../music/music_page.dart';
import '../resources/ResourcePg.dart';

// void main() => runApp(MyHomePage());

// class MyAnimal extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return MaterialApp(
// 	title: 'GeeksforGeeks',
// 	theme: ThemeData(
// 		primarySwatch: Colors.blue,
// 	),
// 	home: MyHomePage(),
// 	debugShowCheckedModeBanner: false,
// 	);
// }
// }
 void main()async {
  // final db =  mongo.Db(MONGO_URL_CHECKIN); //wait to locate url
  //    await db.open(); //opens the connection to url - reuquired db
    
  //   final collection =db.collection(COLLECTION_NAME_checkin);
  //   final users = await collection.findOne(mongo.where.eq('ID', '$email'));

  //   await db.close();
}
class MyAnimal extends StatefulWidget {
  String email;
  String happinessScale;
  // double n =0; 
  MyAnimal({required this.email, required this.happinessScale});
  @override


  _MyAnimalState createState() => _MyAnimalState(email: '$email', happinessScale: '$happinessScale');
}

class _MyAnimalState extends State<MyAnimal> {
  String email;
  // double n;
  String happinessScale;
  // n=double.parse(happinessScale);
  
  // _MyAnimalState({required this.email});
  _MyAnimalState({required this.email, required this.happinessScale});
  @override
  Widget build(BuildContext context){

   String animationName;//success,idle,fail
   int n = int.parse(happinessScale);
    if (n > 80 && n < 100) {
      animationName = "success";
    } else if (n >= 50 && n <= 80) {
      animationName = "idle";
    } else {
      animationName = "fail";
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 212, 245),
      // the bottom bar for navigation between pages
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              IconButton(
                // button
                // mainAxisAlignment: MainAxisAlignment.center,
                icon: Image.asset('assets/game.png'), //image
                iconSize: 50, //size
                onPressed: () {
                  //functionality
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyGame_Meanu(
                            email: ('${email}'),
                            happinessScale: ('$happinessScale')
                          )));
                },
              ),
              IconButton(
                // button
                // mainAxisAlignment: MainAxisAlignment.center,
                icon: Image.asset('assets/journal.png'), //image
                iconSize: 50, //size
                onPressed: () {
                  //functionality
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyJournal(
                            email: ('${email}'),
                            happinessScale: ('$happinessScale')
                          )));
                },
              ),
              IconButton(
                //button
                // mainAxisAlignment: MainAxisAlignment.center,
                icon: Image.asset('assets/home.png'), //image
                iconSize: 50, //size
                onPressed: () {
                  // if tapped, go to this page
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DemoApp(
                            email: ('$email'),
                            happinessScale: ('$happinessScale')
                          )));
                  //functionality
                  // Navigator.pushNamed(context, 'home_page');
                },
              ),
              IconButton(
                // Icon buttom
                // mainAxisAlignment: MainAxisAlignment.center,
                icon: Image.asset('assets/music.png'), //image
                iconSize: 50, //size
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      // if tapped, go to this page
                      builder: (context) => MyMusic(
                            email: ('$email'),
                            happinessScale: ('$happinessScale')
                          )));
                }, //functionality
              ),
              IconButton(
                tooltip: 'Open navigation menu',
                icon: Image.asset('assets/info.png'), //image
                iconSize: 50, //size
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      // if tapped, go to this page
                      builder: (context) => Resources(
                            email: ('$email'),
                            happinessScale: ('$happinessScale')
                          )));

                  //functionality
                },
              ),
              IconButton(
                // Icon buttom
                // mainAxisAlignment: MainAxisAlignment.center,
                icon: Image.asset('assets/animal.png'), //image
                iconSize: 50, //size
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      // if tapped, go to this page
                      builder: (context) => MyAnimal(
                            email: ('$email'),
                            happinessScale: ('$happinessScale')
                          )));
                }, //functionality
              ),
            ],
          )),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 700,
                height: 300,
                child: RiveAnimation.asset(
                  "assets/bear.riv",
                  //test, success,idle,fail
                  // animation: "fail",
                  animations: [animationName],
                  // controllers: [[]{}],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
