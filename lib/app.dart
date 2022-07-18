import 'package:flutter/material.dart';
import 'package:my_book_finder/screens/on_boarding_screen.dart';
import 'package:my_book_finder/styles/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
