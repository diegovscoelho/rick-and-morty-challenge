import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:way_data_technical_challenge/presentation/controllers/character_controller.dart';
import 'package:way_data_technical_challenge/presentation/widgets/status_dropdown.dart';
import 'package:way_data_technical_challenge/presentation/widgets/custom_search_field.dart';

class CharacterSearchFilters extends GetView<CharacterController> {
  const CharacterSearchFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => controller.showFilters.toggle(),
                  child: Text(
                    controller.showFilters.value
                        ? 'Hide filters'
                        : 'Show filters',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.showFilters.value,
                  child: GestureDetector(
                    onTap: controller.resetFilters,
                    child: const Text(
                      'Reset Filters',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: controller.showFilters.value,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomSearchField(
                    hintText: 'Search character by name...',
                    onChanged: controller.filterCharacters,
                    icon: Icons.search,
                    controller: controller.nameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomSearchField(
                    hintText: 'Search by episode number...',
                    onChanged: controller.filterByEpisode,
                    keyboardType: TextInputType.number,
                    icon: Icons.movie,
                    controller: controller.episodeController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Obx(
                    () => StatusDropdown(
                      hintText: 'Filter by status',
                      items: const ['Alive', 'Dead', 'Unknown'],
                      selectedValue: controller.statusQuery.value.isNotEmpty
                          ? controller.statusQuery.value
                          : null,
                      onChanged: (String? newValue) {
                        controller.filterByStatus(newValue ?? '');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
