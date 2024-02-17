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
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 32, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "Filtre",
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
            height: 32,
          ),
          const Row(
            children: [
              Text(
                "Preço",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "médio",
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
          Material(
            child: RangeSlider(
              values: selectedRange,
              onChanged: (RangeValues newRange) {
                setState(() {
                  selectedRange = newRange;
                });
              },
              min: 100,
              max: 1000,
              activeColor: theme.colorScheme.primary,
              inactiveColor: Colors.grey[300],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r"$70k",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                r"$1000k",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Quartos",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              //color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOption("Qualquer", false, context),
              buildOption("1", false, context),
              buildOption("2", true, context),
              buildOption("3+", false, context),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Banheiros",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              //color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOption("Qualquer", true, context),
              buildOption("1", false, context),
              buildOption("2", false, context),
              buildOption("3+", false, context),
            ],
          ),
        ],
      ),
    );
  }
}
