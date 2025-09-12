import 'package:way_data_technical_challenge/data/datasources/character_service.dart';
import 'package:way_data_technical_challenge/data/models/character_model.dart';
import 'package:way_data_technical_challenge/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterService characterService;

  CharacterRepositoryImpl({required this.characterService});

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    return await characterService.fetchAllCharacters();
  }
}