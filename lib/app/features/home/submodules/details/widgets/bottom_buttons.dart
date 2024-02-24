import 'package:flutter/material.dart';

import '../../../../../core/widgets/constants_widget.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildPopupButton(
            context,
            Icons.mail_rounded,
            'Email',
            theme.colorScheme.primary,
            'example@email.com',
          ),
          _buildPopupButton(
            context,
            Icons.call_rounded,
            'Telefone',
            theme.colorScheme.primary,
            '+55 123 456 789',
          ),
        ],
      ),
    );
  }

  Widget _buildPopupButton(
    BuildContext context,
    IconData icon,
    String text,
    Color color,
    String content,
  ) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              content: Text(content),
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              offset: const Offset(0, 4),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: theme.colorScheme.background,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
