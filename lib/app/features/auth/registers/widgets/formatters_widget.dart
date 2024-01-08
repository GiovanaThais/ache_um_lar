import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextLabelFormatter extends StatelessWidget {
  const TextLabelFormatter(
      {super.key,
      required this.textlabelFormatter,
      required this.controller,
      this.validator,
      required this.formatter});

  final String textlabelFormatter;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final TextInputFormatter formatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: TextFormField(
        controller: controller,
        validator: validator,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          formatter,
        ],
        decoration: InputDecoration(
            labelText: textlabelFormatter,
            labelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
