import 'package:flutter/material.dart';
import 'anime_detail_screen.dart';
import '../widgets/anime_card.dart';
import '../services/anime_api_service.dart';

class AnimeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Animes')),
      body: FutureBuilder(
        future: fetchAnimes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar animes.'));
          } else {
            final animes = snapshot.data as List;
            return ListView.builder(
              itemCount: animes.length,
              itemBuilder: (context, index) {
                final anime = animes[index];
                return AnimeCard(
                  title: anime['title'],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimeDetailScreen(anime: anime),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
