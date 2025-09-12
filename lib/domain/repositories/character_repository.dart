import 'package:way_data_technical_challenge/data/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getAllCharacters();
}