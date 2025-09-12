import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:way_data_technical_challenge/data/models/character_model.dart';

class CharacterService {
  final String _initialUrl = "https://rickandmortyapi.com/api/character";

  Future<List<CharacterModel>> fetchAllCharacters() async {
    List<CharacterModel> allCharacters = [];
    String? nextUrl = _initialUrl;

    while (nextUrl != null) {
      final response = await http.get(Uri.parse(nextUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List results = data['results'];

        allCharacters.addAll(results.map((json) => CharacterModel.fromJson(json)).toList());

        nextUrl = data['info']['next'];
      } else {
        throw Exception('Failed to load characters from page: $nextUrl');
      }
    }

    return allCharacters;
  }
}