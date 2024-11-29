import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchAnimes() async {
  final url = Uri.parse('https://api.jikan.moe/v4/anime');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['data'];
  } else {
    throw Exception('Falha ao carregar animes');
  }
}
