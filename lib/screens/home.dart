import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:home_workouts/components/active-workouts.dart';
import 'package:home_workouts/components/workouts-liat.dart';
import 'package:home_workouts/services/auth.dart';

import 'add-workout.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var navigationBar = CurvedNavigationBar(
      items: const <Widget>[
        Icon(Icons.fitness_center),
        Icon(Icons.search),
      ],
      index: 0,
      height: 60,
      color: Colors.white70,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.5),
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (int index) {
        setState(() {
          sectionIndex = index;
        });
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Max-Fit //' +
            (sectionIndex == 0 ? ' Active Workouts' : ' Find Workouts')),
        leading: Icon(Icons.fitness_center),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                AuthService().logOut();
              },
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: SizedBox.shrink())
        ],
      ),
      body: sectionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
      bottomNavigationBar: navigationBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddWorkout()));
        },
      ),
    );
  }
}