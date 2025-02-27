import 'package:flutter/material.dart';
import 'screens/anime_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimeListScreen(),
    );
  }
}
