import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Como podemos ajudar?"),
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
                  leading: const Icon(Icons.description, color: Colors.purple),
                  title: const Text("Documentos e Avaliação de Crédito"),
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
                  leading: const Icon(Icons.key, color: Colors.purple),
                  title: const Text("Entrada no imovel"),
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
                  leading: const Icon(Icons.payment, color: Colors.purple),
                  hoverColor: theme.colorScheme.primary,
                  splashColor: theme.colorScheme.primary,
                  selectedColor: theme.colorScheme.primary,
                  focusColor: theme.colorScheme.primary,
                  textColor: theme.colorScheme.primary,
                  title: const Text("Pagamentos"),
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
                  leading: const Icon(Icons.location_on, color: Colors.purple),
                  hoverColor: theme.colorScheme.primary,
                  splashColor: theme.colorScheme.primary,
                  selectedColor: theme.colorScheme.primary,
                  focusColor: theme.colorScheme.primary,
                  textColor: theme.colorScheme.primary,
                  title: const Text("Visitas"),
                  onTap: () {
                    // Handle the tap on this item
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
