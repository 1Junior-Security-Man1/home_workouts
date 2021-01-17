import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_workouts/domain/user.dart';
import 'package:home_workouts/screens/landing.dart';
import 'package:home_workouts/services/auth.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
        title: 'Max Fit',
        theme: ThemeData(
          primaryColor: Colors.black,
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          ),
        ),
        home: LandingPage(),
      ),
    );
  }
}