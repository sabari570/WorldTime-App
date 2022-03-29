import 'package:flutter/material.dart';
import 'package:worldtime_app/widgets/choose_location.dart';
import 'package:worldtime_app/widgets/home.dart';
import 'package:worldtime_app/widgets/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}
