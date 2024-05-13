import 'package:ache_um_lar/app/features/auth/registers/register_user_page.dart';
import 'package:ache_um_lar/app/features/home/presenter/pages/realty_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthServiceFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String?> registerUser(
      {required String name,
      required String password,
      required String email}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateDisplayName(name);

      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return ("O usuário já está cadastrado!");
      }
      // if (e.code == "email-already-in-use") {
      //   return ("O usuário já está cadastrado!");
      // }
      return "Erro ao cadastrar usuario";
    }
  }

  Future<void> logOut() async {
    return _firebaseAuth.signOut();
  }

  Future<String?> loginUsers(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

class ChangePage extends StatelessWidget {
  const ChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const CardPage();
          } else {
            return const RegisterUserPage();
          }
        });
  }
}
