import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextLabel extends StatefulWidget {
  const TextLabel({
    super.key,
    required this.textlabel,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String textlabel;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final bool isPassword;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  State<TextLabel> createState() => _TextLabelState();
}

class _TextLabelState extends State<TextLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.textlabel,
          labelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          border: const OutlineInputBorder(),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
