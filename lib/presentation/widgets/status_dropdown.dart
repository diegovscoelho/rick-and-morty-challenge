import 'package:flutter/material.dart';

class StatusDropdown extends StatelessWidget {
  const StatusDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.hintText,
    required this.onChanged,
  });

  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        initialValue: selectedValue,
        onChanged: onChanged,
        borderRadius: BorderRadius.circular(16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.person, color: Colors.grey),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}
