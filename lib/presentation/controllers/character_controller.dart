import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:way_data_technical_challenge/data/models/character_model.dart';
import 'package:way_data_technical_challenge/domain/usecases/get_all_characters_usecase.dart';

class CharacterController extends GetxController {
  CharacterController({required this.getAllCharactersUsecase});

  final GetAllCharactersUsecase getAllCharactersUsecase;
  final List<CharacterModel> _allCharacters = <CharacterModel>[];
  final RxList<CharacterModel> filteredCharacters = <CharacterModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool showFilters = true.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController episodeController = TextEditingController();
  final RxString _statusQuery = ''.obs;

  RxString get statusQuery => _statusQuery;

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
    _applyFilters(nameQuery: query);
  }

  void filterByEpisode(String query) {
    _applyFilters(episodeQuery: query);
  }
  
  void filterByStatus(String? query) {
    _statusQuery.value = query ?? '';
    _applyFilters(statusQuery: query ?? '');
  }
  
  void resetFilters() {
    nameController.clear();
    episodeController.clear();
    _statusQuery.value = '';
    _applyFilters();
  }

  void _applyFilters({String? nameQuery, String? episodeQuery, String? statusQuery}) {
    final name = nameQuery ?? nameController.text;
    final episode = episodeQuery ?? episodeController.text;
    final status = statusQuery ?? _statusQuery.value;

    final filteredList = _allCharacters.where((character) {
      bool nameMatch = character.name.toLowerCase().contains(name.toLowerCase());
      bool episodeMatch = true;
      bool statusMatch = true;

      if (episode.isNotEmpty) {
        episodeMatch = character.episode.any((url) {
          final uri = Uri.parse(url);
          return uri.pathSegments.last == episode;
        });
      }
      
      if (status.isNotEmpty) {
        statusMatch = character.status.toLowerCase().contains(status.toLowerCase());
      }

      return nameMatch && episodeMatch && statusMatch;
    }).toList();

    filteredCharacters.value = filteredList;
  }

}
