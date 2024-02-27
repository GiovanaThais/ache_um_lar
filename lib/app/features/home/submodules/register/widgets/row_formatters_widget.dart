import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter formatter;

  const RowFormatters(
      {super.key, required this.label, required this.formatter});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter,
      ],
    );
  }
}
