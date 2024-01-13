import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({
    super.key,
    required this.textlabel,
    required this.controller,
    this.validator,
  });

  final String textlabel;
  final String? Function(String? value)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            labelText: textlabel,
            labelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            border: OutlineInputBorder()),
      ),
    );
  }
}
