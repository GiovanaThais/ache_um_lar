import 'package:flutter/material.dart';

class CountryBottomSheetWidget extends StatefulWidget {
  final ValueSetter<bool> onBrazilSelected;
  final ValueSetter<bool> onMexicoSelected;

  const CountryBottomSheetWidget({
    Key? key,
    required this.onBrazilSelected,
    required this.onMexicoSelected,
  }) : super(key: key);

  @override
  State<CountryBottomSheetWidget> createState() =>
      _CountryBottomSheetWidgetState();
}

class _CountryBottomSheetWidgetState extends State<CountryBottomSheetWidget> {
  bool isBrazilSelected = false;
  bool isMexicoSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        children: [
          const Text(
            "Alterar o país",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            " Onde você deseja buscar um imóvel?",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: isBrazilSelected,
                onChanged: (checked) {
                  setState(() {
                    isBrazilSelected = checked!;
                    widget.onBrazilSelected(checked!);
                  });
                },
              ),
              const Text("Brasil"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: isMexicoSelected,
                onChanged: (checked) {
                  setState(() {
                    isMexicoSelected = checked!;
                    widget.onMexicoSelected(checked!);
                  });
                },
              ),
              const Text("México"),
            ],
          ),
        ],
      ),
    );
  }
}
