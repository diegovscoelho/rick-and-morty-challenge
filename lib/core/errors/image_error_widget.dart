import 'package:flutter/material.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.error, size: 156, color: Color(0xFFB9262D)),
        const SizedBox(height: 8),
        Text(
          'Failed to load asset',
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      ],
    );
  }
}