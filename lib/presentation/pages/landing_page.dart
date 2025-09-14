import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:way_data_technical_challenge/presentation/controllers/character_controller.dart';
import 'package:way_data_technical_challenge/presentation/widgets/character_grid.dart';
import 'package:way_data_technical_challenge/presentation/widgets/character_search_filters.dart';
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
              padding: const EdgeInsets.only(top: 96),
              child: SvgPicture.asset(
                'assets/images/rick_and_morty.svg',
                height: 95,
              ),
            ),
            const SizedBox(height: 32),
            Column(children: [CharacterSearchFilters()]),
            const Expanded(child: CharacterGrid()),
          ],
        );
      }),
    );
  }
}
