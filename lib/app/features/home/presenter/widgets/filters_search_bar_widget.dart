import 'package:flutter/material.dart';

import 'build_options_filters_widget.dart';

class FilterSearchBarWidget extends StatefulWidget {
  const FilterSearchBarWidget({super.key});

  @override
  State<FilterSearchBarWidget> createState() => _FilterSearchBarWidgetState();
}

class _FilterSearchBarWidgetState extends State<FilterSearchBarWidget> {
  var selectedRange = const RangeValues(400, 1000);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "Filtros",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "sua pesquisa",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            children: [
              Text(
                "Preço",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "média",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          RangeSlider(
            values: selectedRange,
            onChanged: (RangeValues newRange) {
              setState(() {
                selectedRange = newRange;
              });
            },
            min: 100,
            max: 1000,
            activeColor: Colors.blue[900],
            inactiveColor: Colors.grey[300],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r"$70k",
                style: TextStyle(
                  fontSize: 4,
                ),
              ),
              Text(
                r"$1000k",
                style: TextStyle(
                  fontSize: 4,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            "Rooms",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOption("Any", false),
              buildOption("1", false),
              buildOption("2", true),
              buildOption("3+", false),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            "Bathrooms",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOption("Any", true),
              buildOption("1", false),
              buildOption("2", false),
              buildOption("3+", false),
            ],
          ),
        ],
      ),
    );
  }
}
