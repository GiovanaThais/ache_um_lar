import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset('assets/icons/avatar.png'),
          title: const Text("User 1"),
          subtitle: const Text("Olá \n Tudo bem?"),
          trailing: PopupMenuButton<String>(
              onSelected: (menu) {},
              itemBuilder: (BuildContext bc) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem(
                    value: "opção 1",
                    child: Text("Option 1"),
                  )
                ];
              }),
          isThreeLine: true,
        ),
        ListTile(
          leading: Image.asset('assets/icons/avatar.png'),
          title: const Text("User 2"),
          subtitle: const Text("Olá"),
          trailing: const Icon(Icons.access_time),
        ),
      ],
    );
  }
}
