import 'package:flutter/material.dart';

class AdvertisementPage extends StatelessWidget {
  const AdvertisementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destacar Anúncio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Destaque Seu Anúncio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Aumente a visibilidade do seu anúncio para mais pessoas destacando-o na página inicial.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para destacar o anúncio
              },
              child: const Text('Ver planos para Destacar Anúncios'),
            ),
          ],
        ),
      ),
    );
  }
}
