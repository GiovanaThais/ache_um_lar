import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text("Documentos e Avaliação de Crédito"),
              onTap: () {
                // Handle the tap on this item
              },
            ),
            ListTile(
              leading: const Icon(Icons.key),
              title: const Text("Entrada no imovel"),
              onTap: () {
                // Handle the tap on this item
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text("Pagamentos"),
              onTap: () {
                // Handle the tap on this item
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Visitas"),
              onTap: () {
                // Handle the tap on this item
              },
            ),
          ],
        ),
      ),
    );
  }
}
