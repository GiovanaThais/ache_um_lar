import 'package:ache_um_lar/app/features/home/presenter/pages/help_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Assuntos a explorar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: const Icon(Icons.accessibility_new_rounded,
                      color: Colors.purple),
                  title: const Text("Acessibilidade"),
                  hoverColor: theme.colorScheme.primary,
                  splashColor: theme.colorScheme.primary,
                  selectedColor: theme.colorScheme.primary,
                  focusColor: theme.colorScheme.primary,
                  textColor: theme.colorScheme.primary,
                  onTap: () {
                    // Handle the tap on this item
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading:
                      const Icon(Icons.business_sharp, color: Colors.purple),
                  title: const Text("Sobre nós"),
                  hoverColor: theme.colorScheme.primary,
                  splashColor: theme.colorScheme.primary,
                  selectedColor: theme.colorScheme.primary,
                  focusColor: theme.colorScheme.primary,
                  textColor: theme.colorScheme.primary,
                  onTap: () {
                    // Handle the tap on this item
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: const Icon(Icons.language, color: Colors.purple),
                  title: const Text("Alterar País"),
                  hoverColor: theme.colorScheme.primary,
                  splashColor: theme.colorScheme.primary,
                  selectedColor: theme.colorScheme.primary,
                  focusColor: theme.colorScheme.primary,
                  textColor: theme.colorScheme.primary,
                  onTap: () {
                    alterCountryMethod(
                      context,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> alterCountryMethod(
  BuildContext context,
) {
  bool isBrazilSelected = false;
  bool isMexicoSelected = false;
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      context: context,
      builder: (BuildContext bc) {
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
                  " Onde você deseja buscar um imovél?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: isBrazilSelected,
                      onChanged: (bool? value) {
                        // Handle Brazil checkbox change
                        isBrazilSelected = value ?? false;
                      },
                    ),
                    const Text("Brasil"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isMexicoSelected,
                      onChanged: (bool? value) {
                        // Handle Mexico checkbox change
                        isMexicoSelected = value ?? false;
                      },
                    ),
                    const Text("México"),
                  ],
                ),
              ],
            ));
      });
}
