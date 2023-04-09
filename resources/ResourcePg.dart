import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/personalPg.dart';

import '../DemoApp.dart';
import '../animal/animal.dart';
import '../games/games_meanu_pg.dart';
import '../journal_page.dart';
import '../music/music_page.dart';
import 'bottom_bar.dart';
// import 'cookie_page.dart';
import 'ProfessionalPg.dart';

class Resources extends StatefulWidget {
  String email;
  String happinessScale;
  Resources({required this.email, required this.happinessScale});

  @override
  State<Resources> createState() => _ResourceState(email: '$email', happinessScale: '$happinessScale');
}

class _ResourceState extends State<Resources>
    with SingleTickerProviderStateMixin {
  String email;
  String happinessScale;
  _ResourceState({required this.email, required this.happinessScale});
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          Text(
            'Resources',
            style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color.fromARGB(255, 33, 110, 169),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('Professional Resources',
                      style: TextStyle(
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Personal Help',
                      style: TextStyle(
                        fontSize: 21.0,
                      )),
                ),
              ]),
          Container(
            height: MediaQuery.of(context).size.height - 20.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                ProfessionalPage(),
                PersonalPage(),
              ],
            ),
          )
        ],
      ),
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
    );
  }
}
