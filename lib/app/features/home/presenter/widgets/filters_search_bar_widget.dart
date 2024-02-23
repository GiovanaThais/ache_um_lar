import 'package:flutter/material.dart';

import 'build_options_filters_widget.dart';

class FilterSearchBarWidget extends StatefulWidget {
  const FilterSearchBarWidget({super.key});

  @override
  State<FilterSearchBarWidget> createState() => _FilterSearchBarWidgetState();
}

class _FilterSearchBarWidgetState extends State<FilterSearchBarWidget> {
  var selectedRange = const RangeValues(400, 1000);
  bool anyBedroomsSelected = false;
  bool oneBedroomSelected = false;
  bool twoBedroomsSelected =
      true; // Definindo 2 quartos como selecionado inicialmente
  bool threePlusBedroomsSelected = false;

  bool anyBathroomsSelected =
      true; // Definindo "Qualquer" banheiro como selecionado inicialmente
  bool oneBathroomSelected = false;
  bool twoBathroomsSelected = false;
  bool threePlusBathroomsSelected = false;

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
                r"R$70k",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                r"R$1000k",
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
              buildOption("Qualquer", anyBedroomsSelected, () {
                setState(() {
                  anyBedroomsSelected = !anyBedroomsSelected;
                });
              }, context),
              buildOption("1", oneBedroomSelected, () {
                setState(() {
                  oneBedroomSelected = !oneBedroomSelected;
                });
              }, context),
              buildOption("2", twoBedroomsSelected, () {
                setState(() {
                  twoBedroomsSelected = !twoBedroomsSelected;
                });
              }, context),
              buildOption("3+", threePlusBedroomsSelected, () {
                setState(() {
                  threePlusBedroomsSelected = !threePlusBedroomsSelected;
                });
              }, context),
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
              buildOption("Qualquer", anyBathroomsSelected, () {
                setState(() {
                  anyBathroomsSelected = !anyBathroomsSelected;
                });
              }, context),
              buildOption("1", oneBathroomSelected, () {
                setState(() {
                  oneBathroomSelected = !oneBathroomSelected;
                });
              }, context),
              buildOption("2", twoBathroomsSelected, () {
                setState(() {
                  twoBathroomsSelected = !twoBathroomsSelected;
                });
              }, context),
              buildOption("3+", threePlusBathroomsSelected, () {
                setState(() {
                  threePlusBathroomsSelected = !threePlusBathroomsSelected;
                });
              }, context),
            ],
          ),
        ],
      ),
    );
  }
}
