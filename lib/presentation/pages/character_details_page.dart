import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:way_data_technical_challenge/core/utils/string_extensions.dart';
import 'package:way_data_technical_challenge/data/models/character_model.dart';
import 'package:way_data_technical_challenge/presentation/controllers/character_controller.dart';
import 'package:way_data_technical_challenge/presentation/widgets/character_info_card.dart';
import 'package:way_data_technical_challenge/presentation/widgets/detail_row.dart';

class CharacterDetailsPage extends GetView<CharacterController> {
  const CharacterDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterModel character = Get.arguments as CharacterModel;
    return Scaffold(
      backgroundColor: const Color(0xFF072525),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              background: Hero(
                tag: character.id,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      character.image,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Color(0x7F000000)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: CharacterInfoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailRow(
                        icon: Icons.person,
                        label: 'Status:',
                        value: character.status.capitalizeIfUnknown(),
                        color: character.status == 'Alive'
                            ? Colors.green[300]
                            : character.status == 'Dead'
                                ? Colors.red[300]
                                : Colors.white,
                      ),
                      DetailRow(
                        icon: Icons.public,
                        label: 'Species:',
                        value: character.species.capitalizeIfUnknown(),
                      ),
                      DetailRow(
                        icon: Icons.transgender,
                        label: 'Gender:',
                        value: character.gender.capitalizeIfUnknown(),
                      ),
                      DetailRow(
                        icon: Icons.place,
                        label: 'Origin:',
                        value: character.origin.name.capitalizeIfUnknown(),
                      ),
                      DetailRow(
                        icon: Icons.location_on,
                        label: 'Last known location:',
                        value: character.location.name.capitalizeIfUnknown(),
                      ),
                      if (character.type.isNotEmpty)
                        DetailRow(
                          icon: Icons.category,
                          label: 'Type:',
                          value: character.type.capitalizeIfUnknown(),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CharacterInfoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Episodes:',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        character.episode
                            .map((e) {
                              final uri = Uri.parse(e);
                              return uri.pathSegments.last;
                            })
                            .join(', '),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ]),
          ),
        ],
      ),
    );
  }
}
