import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../page/advertisement_page.dart';

class BottomButtonsChat extends StatelessWidget {
  const BottomButtonsChat({super.key, this.onPressedRemove});
  final void Function()? onPressedRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildVisitButton(context),
              const SizedBox(height: 16),
              _buildMapButton(context),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildChatButton(context),
              const SizedBox(height: 20),
              _buildSimulationButton(context),
            ],
          ),
          const SizedBox(height: 36),
          _buildBigButton(Icons.videocam, 'Tour Digital', () {
            // lógica para o tour digital
          }, context),
          const SizedBox(
            height: 20,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Informações gerais", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text(
                    "Idade da construção:",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("    6 anos (2018)"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 36),
          _buildBigButton(Icons.star_border, 'Destacar Anúncio', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdvertisementPage()),
            );
          }, context),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 30),
          _buildEditButton(context),
          const SizedBox(height: 10),
          _buildRemoveButton(context, onPressedRemove),
        ],
      ),
    );
  }

  Widget _buildVisitButton(context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () {
        Modular.to.pushNamed('/visit');
      },
      icon: const Icon(Icons.calendar_today),
      label: const Text('Agendar Visita'),
      style: ElevatedButton.styleFrom(
        //primary: theme.colorScheme.primary,
        //onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildMapButton(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () async {
        //  lógica para abrir o mapa
        print('Abrir Mapa clicado');

        await launchUrl(Uri.parse("google.navigation:q=Orlando FL&mode=d"));
      },
      icon: const Icon(Icons.map),
      label: const Text('Abrir Mapa'),
      style: ElevatedButton.styleFrom(
        //primary: theme.colorScheme.primary,
        //onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildChatButton(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ChatPage()),
        // );
        Modular.to.pushNamed('/chat');
      },
      icon: const Icon(Icons.chat),
      label: const Text('Chat'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildSimulationButton(context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () {
        // Implemente a lógica para simular financiamento
        print('Simular Financiamento clicado');
      },
      icon: const Icon(Icons.monetization_on),
      label: const Text('Simular Financiamento'),
      style: ElevatedButton.styleFrom(
        //   primary: theme.colorScheme.primary,
        //   onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildBigButton(IconData icon, String label, VoidCallback onPressed, context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          shadowColor: theme.colorScheme.tertiary,
          // primary: theme.colorScheme.primary,
          // onPrimary:theme.colorScheme.onSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdvertisementPage()),
          );
        },
        icon: const Icon(Icons.edit, color: Colors.white),
        label: const Text('Editar Anúncio', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildRemoveButton(BuildContext context, void Function()? onPressed) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const AdvertisementPage()),
          // );
          onPressed?.call();
        },
        icon: const Icon(Icons.delete, color: Colors.white),
        label: const Text('Remover Anúncio', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.error,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
