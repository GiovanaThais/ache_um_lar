import 'package:flutter/material.dart';

import 'individual_chat_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMessageCard(
            'User 1',
            'Olá\nTudo bem?',
            Icons.more_vert,
            context,
            'assets/icons/avatar.png',
          ),
          const SizedBox(height: 16.0),
          _buildMessageCard(
            'User 2',
            'Olá',
            Icons.more_vert, // Add menu icon for this message
            context,
            'assets/icons/avatar.png',
          ),
        ],
      ),
    );
  }

  Widget _buildMessageCard(
    String username,
    String message,
    IconData? menuIcon,
    BuildContext context,
    String avatarImagePath,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualChatPage(username: username),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatarImagePath),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              if (menuIcon != null)
                PopupMenuButton<String>(
                  icon: Icon(menuIcon),
                  onSelected: (menu) {
                    // Handle menu selection
                  },
                  itemBuilder: (BuildContext bc) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem(
                        value: "opção 1",
                        child: Text("Option 1"),
                      ),
                    ];
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
