import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:way_data_technical_challenge/presentation/controllers/character_controller.dart';
import 'package:way_data_technical_challenge/presentation/widgets/character_grid.dart';
import 'package:way_data_technical_challenge/presentation/widgets/custom_search_field.dart';
import 'package:way_data_technical_challenge/presentation/widgets/loading_animation.dart';

class LandingPage extends GetView<CharacterController> {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xAF4A9E8C),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: LoadingAnimation());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64),
              child: SvgPicture.asset(
                'assets/images/rick_and_morty.svg',
                height: 95,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: CustomSearchField(
                  hintText: 'Search Character by Name...',
                  onChanged: controller.filterCharacters,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: CustomSearchField(
                  hintText: 'Search by Episode Number...',
                  onChanged: controller.filterByEpisode,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const Expanded(child: CharacterGrid()),
          ],
        );
      }),
    );
  }
}
