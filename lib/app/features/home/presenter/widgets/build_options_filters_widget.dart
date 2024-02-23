import 'package:flutter/material.dart';

Widget buildOption(
    String text, bool selected, VoidCallback onTapCallback, context) {
  final theme = Theme.of(context);
  return InkWell(
    onTap: onTapCallback,
    child: Column(
      children: [
        Container(
          height: 45,
          width: 65,
          decoration: BoxDecoration(
              color: selected ? theme.colorScheme.primary : Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(
                width: selected ? 0 : 1,
                color: theme.colorScheme.primary,
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : theme.colorScheme.onSurface,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
