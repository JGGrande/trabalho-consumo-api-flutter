import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trabalho_api/models/personagem.dart';

class PersonagemRemote {
  Future<List<Personagem>> get() async {
    final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      final List<dynamic> results = responseBody['results'];
      return results.map((e) => Personagem(
        id: e['id'],
        name: e['name'],
        image: e['image'],
        species: e['species'],
        status: e['status'],
      )).toList();
    } else {
      throw Exception('Falha ao carregar os personagens');
    }
  }
}
