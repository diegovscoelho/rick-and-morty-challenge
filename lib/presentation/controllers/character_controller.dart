import 'package:get/get.dart';
import 'package:way_data_technical_challenge/data/models/character_model.dart';
import 'package:way_data_technical_challenge/domain/usecases/get_all_characters_usecase.dart';

class CharacterController extends GetxController {

  final GetAllCharactersUsecase getAllCharactersUsecase;

  final List<CharacterModel> _allCharacters = <CharacterModel>[];
  
  final RxList<CharacterModel> filteredCharacters = <CharacterModel>[].obs; 

  final RxBool isLoading = true.obs;

  CharacterController({required this.getAllCharactersUsecase});

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      isLoading.value = true;
      final result = await getAllCharactersUsecase.call();
      _allCharacters.addAll(result);
      filteredCharacters.value = _allCharacters;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load characters');
    } finally {
      isLoading.value = false;
    }
  }

  void filterCharacters(String query) {
    if (query.isEmpty) {
      filteredCharacters.value = _allCharacters;
      return;
    }

    final lowercaseQuery = query.toLowerCase(); 
    
    final filteredList = _allCharacters.where((character) {
      return character.name.toLowerCase().contains(lowercaseQuery);
    }).toList();
    
    filteredCharacters.value = filteredList; 
  }
}