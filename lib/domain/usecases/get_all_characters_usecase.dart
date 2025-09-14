import 'package:way_data_technical_challenge/data/models/character_model.dart';
import 'package:way_data_technical_challenge/domain/repositories/character_repository.dart';

class GetAllCharactersUsecase {
  GetAllCharactersUsecase({required this.repository});

  final CharacterRepository repository;

  Future<List<CharacterModel>> call() async {
    return await repository.getAllCharacters();
  }
}