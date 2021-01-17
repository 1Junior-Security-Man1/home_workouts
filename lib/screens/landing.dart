import 'package:flutter/material.dart';
import 'package:home_workouts/domain/user.dart';
import 'package:home_workouts/screens/auth.dart';
import 'package:home_workouts/screens/home.dart';
import 'package:provider/provider.dart';
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
