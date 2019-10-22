import 'package:flutter/material.dart';
import 'package:my_digital_id/screens/my_profile.dart';
import 'package:my_digital_id/screens/search_screen.dart';
import 'package:my_digital_id/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Digital ID',
      home: SplashScreen(),
    );
  }
}
