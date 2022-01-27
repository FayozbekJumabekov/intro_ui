import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/pages/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        IntroPage.id: (context) => IntroPage(),
        HomePage.id: (context) => HomePage()
      },
    );
  }
}
