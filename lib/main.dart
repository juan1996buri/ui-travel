import 'package:flutter/material.dart';
import 'package:ui_travel/ui/home/home_travel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            elevation: 0),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeTravel(),
    );
  }
}
