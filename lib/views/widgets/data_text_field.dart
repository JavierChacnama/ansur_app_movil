import 'package:flutter/material.dart';

class DataTextField extends StatelessWidget {
  const DataTextField({
    super.key,
    required this.label,
    required this.maxLength,

  });

  final String label;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
