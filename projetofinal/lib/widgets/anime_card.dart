import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  AnimeCard({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
