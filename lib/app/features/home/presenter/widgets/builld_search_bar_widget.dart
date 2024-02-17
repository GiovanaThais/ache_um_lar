import 'package:ache_um_lar/app/features/home/presenter/widgets/filters_search_bar_widget.dart';
import 'package:flutter/material.dart';

import '../pages/search_page.dart';

Widget buildSearchBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchPage(),
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.search_rounded),
                  SizedBox(width: 8),
                  Text(
                    'Pesquisar',
                  ),
                ],
              ),
            ),
          ),
        ),
        // const Expanded(
        //   child: TextField(
        //     decoration: InputDecoration(
        //       hintText: "Pesquise ",
        //       prefixIcon: Icon(Icons.search, color: Colors.grey),
        //     ),
        //   ),
        // ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: const Icon(Icons.filter_list_rounded,
              color: Color.fromARGB(255, 146, 6, 118)),
        ),
      ],
    ),
  );
}

void _showBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return const Wrap(
          children: [
            FilterSearchBarWidget(),
          ],
        );
      });
}
