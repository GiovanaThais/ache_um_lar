import 'package:ache_um_lar/app/features/home/submodules/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomButtonsChat extends StatelessWidget {
  const BottomButtonsChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
              const SizedBox(height: 16),
              _buildSimulationButton(context),
            ],
          ),
          const SizedBox(height: 16),
          _buildBigButton(
            Icons.videocam,
            'Tour Digital',
            () {
              // lógica para o tour digital
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Informações gerais",
                  style: TextStyle(fontWeight: FontWeight.bold)),
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
        ],
      ),
    );
  }

  Widget _buildVisitButton(context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () {
        // lógica para agendar a visita
        print('Agendar Visita clicado');
      },
      icon: Icon(Icons.calendar_today),
      label: Text('Agendar Visita'),
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
        Material(
          child: InkWell(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage()),
            );
          }),
        );
        //Modular.to.pushNamed('/chat/');
      },
      icon: const Icon(Icons.chat),
      label: const Text('Chat'),
      style: ElevatedButton.styleFrom(
        //primary: theme.colorScheme.primary,
        // onPrimary: Colors.white,
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
      icon: Icon(Icons.monetization_on),
      label: Text('Simular Financiamento'),
      style: ElevatedButton.styleFrom(
        //   primary: theme.colorScheme.primary,
        //   onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildBigButton(IconData icon, String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.deepPurple,
          primary: Color.fromARGB(255, 134, 0, 158),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
