import 'package:flutter/material.dart';
import 'color.dart';
import 'home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: tdBGColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen(),
        appBar: PreferredSize(child: TopBar(), preferredSize: Size.fromHeight(120)),
      ),
    );
  }
}

