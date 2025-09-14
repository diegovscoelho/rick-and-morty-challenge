import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:way_data_technical_challenge/core/errors/image_error_widget.dart';
import 'package:way_data_technical_challenge/core/utils/string_extensions.dart';
import 'package:way_data_technical_challenge/data/models/character_model.dart';
import 'package:way_data_technical_challenge/presentation/controllers/character_controller.dart';

// TODO: Melhorar design desta página
// TODO: Componentizar
class CharacterDetailsPage extends GetView<CharacterController> {
  const CharacterDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterModel character = Get.arguments as CharacterModel;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            character.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const ImageErrorWidget();
            },
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(color: Colors.black.withValues(alpha: 0.7)),
          ),
          CustomScrollView(
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
                          errorBuilder: (context, error, stackTrace) {
                            return const ImageErrorWidget();
                          },
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
                    child: Card(
                      color: Colors.black.withValues(alpha: 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDetailRow(
                              context,
                              icon: Icons.person,
                              label: 'Status:',
                              value: character.status.capitalizeIfUnknown(),
                              color:
                                  character.status == 'Alive'
                                      ? Colors.green[300]
                                      : character.status == 'Dead'
                                      ? Colors.red[300]
                                      : Colors.white,
                            ),
                            _buildDetailRow(
                              context,
                              icon: Icons.public,
                              label: 'Species:',
                              value: character.species.capitalizeIfUnknown(),
                            ),
                            _buildDetailRow(
                              context,
                              icon: Icons.transgender,
                              label: 'Gender:',
                              value: character.gender.capitalizeIfUnknown(),
                            ),
                            _buildDetailRow(
                              context,
                              icon: Icons.place,
                              label: 'Origin:',
                              value: character.origin.name.capitalizeIfUnknown(),
                            ),
                            _buildDetailRow(
                              context,
                              icon: Icons.location_on,
                              label: 'Last known location:',
                              value: character.location.name.capitalizeIfUnknown(),
                            ),
                            if (character.type.isNotEmpty)
                              _buildDetailRow(
                                context,
                                icon: Icons.category,
                                label: 'Type:',
                                value: character.type.capitalizeIfUnknown(),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      color: Colors.black.withValues(alpha: 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Episodes:',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
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
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String label,
    required String value,
    IconData? icon,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 4),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
            ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: '$label ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value, style: TextStyle(color: color)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
