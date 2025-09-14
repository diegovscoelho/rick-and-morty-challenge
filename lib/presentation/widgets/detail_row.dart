import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.color,
  });

  final String label;
  final String value;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: '$label ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: value,
                    style: TextStyle(color: color),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
