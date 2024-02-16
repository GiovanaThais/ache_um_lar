import 'package:flutter/material.dart';

Widget buildOption(String text, bool selected) {
  return Container(
    height: 45,
    width: 65,
    decoration: BoxDecoration(
        color: selected ? Colors.blue[900] : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: selected ? 0 : 1,
          color: Colors.grey,
        )),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontSize: 14,
        ),
      ),
    ),
  );
}
