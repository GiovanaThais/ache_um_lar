import 'package:ache_um_lar/app/core/components/snackbar_componets.dart';
import 'package:ache_um_lar/app/features/auth/registers/register_user_page.dart';
import 'package:ache_um_lar/app/features/auth/service/auth_service_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/components/wave_clipper.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordPage({super.key});

  Future<void> _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Um e-mail de redefinição de senha foi enviado para ${emailController.text}'),
          duration: Duration(seconds: 5),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro: $e'),
          duration: const Duration(seconds: 5),
        ),
      );
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Redefinir Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Insira seu email",
                    hintStyle: TextStyle(color: theme.colorScheme.primary),
                    prefixIcon: Icon(
                      Icons.person,
                      color: theme.colorScheme.primary,
                    ),
                    border: const OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _resetPassword(context),
              child: const Text('Redefinir Senha'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                navigateToLoginPage();
              },
              child: const Text('Já possui uma conta? Faça login aqui'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                navigateToRegisterPage();
              },
              child: const Text('Ainda não tem uma conta?'),
            ),
          ],
        ),
      ),
    );
  }
}

void navigateToRegisterPage() {
  Modular.to.pushNamed('/auth/registerUser');
}

void navigateToLoginPage() {
  Modular.to.pushNamed('/auth/login');
}
