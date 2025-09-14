import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:way_data_technical_challenge/presentation/controllers/character_controller.dart';
import 'package:way_data_technical_challenge/presentation/widgets/character_card.dart';
import 'package:way_data_technical_challenge/presentation/widgets/loading_animation.dart';

class CharacterGrid extends GetView<CharacterController> {
  const CharacterGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const Center(child: LoadingAnimation());
        }
        if (controller.filteredCharacters.isEmpty) {
          return Container(
            decoration: BoxDecoration(
            color: const Color(0x790A3536),
            borderRadius: BorderRadius.circular(16),
          ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No character found',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.error, color: Color.fromARGB(255, 139, 36, 28)),
                  ],
                ),
              ),
            ),
          );
        }
        return Container(
          decoration: BoxDecoration(
            color: const Color(0x790A3536),
            borderRadius: BorderRadius.circular(16),
          ),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.75,
            ),
            itemCount: controller.filteredCharacters.length,
            itemBuilder: (context, index) {
              final character = controller.filteredCharacters[index];
              return CharacterCard(
                character: character,
                onTap: () {
                  Get.toNamed('/character_details_page', arguments: character);
                },
              );
            },
          ),
        );
      },
    );
  }
}
