import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter formatter;
  final TextEditingController controller;

  const RowFormatters({
    super.key,
    required this.label,
    required this.formatter,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter,
      ],
      keyboardType: TextInputType.number,
    );
  }
}
