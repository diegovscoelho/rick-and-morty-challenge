import 'package:get/get.dart';
import 'package:way_data_technical_challenge/data/models/character_model.dart';
import 'package:way_data_technical_challenge/domain/usecases/get_all_characters_usecase.dart';

class CharacterController extends GetxController {
  CharacterController({required this.getAllCharactersUsecase});

  final GetAllCharactersUsecase getAllCharactersUsecase;
  final List<CharacterModel> _allCharacters = <CharacterModel>[];
  final RxList<CharacterModel> filteredCharacters = <CharacterModel>[].obs;
  final RxBool isLoading = true.obs;

  final RxString _nameQuery = ''.obs;
  final RxString _episodeQuery = ''.obs;

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
    _nameQuery.value = query;
    _applyFilters();
  }

  void filterByEpisode(String query) {
    _episodeQuery.value = query;
    _applyFilters();
  }

  void _applyFilters() {
    final nameQuery = _nameQuery.value.toLowerCase();
    final episodeQuery = _episodeQuery.value.toLowerCase();

    final filteredList = _allCharacters.where((character) {
      bool nameMatch = character.name.toLowerCase().contains(nameQuery);
      bool episodeMatch = true;

      if (episodeQuery.isNotEmpty) {
        episodeMatch = character.episode.any((url) {
          final uri = Uri.parse(url);
          return uri.pathSegments.last == episodeQuery;
        });
      }

      return nameMatch && episodeMatch;
    }).toList();

    filteredCharacters.value = filteredList;
  }
}
