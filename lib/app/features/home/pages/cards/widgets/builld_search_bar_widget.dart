import 'package:flutter/material.dart';

Widget buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            // Ação para o botão de filtro
          },
          child: const Icon(Icons.filter_list_rounded,
              color: Color.fromARGB(255, 146, 6, 118)),
        ),
      ],
    ),
  );
}
