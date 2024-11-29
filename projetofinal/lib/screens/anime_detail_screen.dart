import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatelessWidget {
  final Map anime;

  AnimeDetailScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(anime['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              anime['title'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(anime['synopsis'] ?? 'Descrição não disponível.'),
          ],
        ),
      ),
    );
  }
}
