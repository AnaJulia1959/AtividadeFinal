import 'package:flutter/material.dart';
import '../database/anime_database.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: FutureBuilder(
        future: AnimeDatabase.getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar favoritos.'));
          } else {
            final favorites = snapshot.data as List<Map>;
            if (favorites.isEmpty) {
              return Center(child: Text('Nenhum favorito adicionado.'));
            }
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return ListTile(
                  title: Text(favorite['name']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
