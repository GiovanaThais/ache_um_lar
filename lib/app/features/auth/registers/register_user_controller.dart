import 'package:ache_um_lar/app/features/auth/registers/user_model.dart';
import 'package:flutter/material.dart';
import 'package:ache_um_lar/app/core/components/snackbar_componets.dart';
import 'package:ache_um_lar/app/features/auth/service/auth_service_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ache_um_lar/app/core/services/shared_preferences/app_storage_service.dart';
import 'package:uuid/uuid.dart';

class RegisterUserController {
  final ValueNotifier<UserModel> userDataNotifier =
      ValueNotifier<UserModel>(UserModel(
    name: '',
    birthDate: DateTime.now(),
    cellPhone: '',
    email: '',
    userType: '',
    uid: '',
  ));

  final AuthServiceFirebase _authService = AuthServiceFirebase();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final AppStorageService _storage = AppStorageService();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController cellController = TextEditingController();
  final TextEditingController creciController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnpjController = TextEditingController();

  DateTime? birthDate;

  get selectedOption => null;

  void loadData() async {
    nameController.text = await _storage.getRegisterDataName();
    emailController.text = await _storage.getRegisterEmail();
    passwordController.text = await _storage.getRegisterPassword();
    creciController.text = await _storage.getRegisterCreci();

    birthDateController.text = await _storage.getRegisterBirthday();
    if (birthDateController.text.isNotEmpty) {
      birthDate = DateTime.parse(birthDateController.text);
    }

    cellController.text = await _storage.getRegisterCellphone();

    updateUserData();
  }

  void updateUserData() {
    userDataNotifier.value = UserModel(
      name: nameController.text,
      birthDate: birthDate ?? DateTime.now(),
      cellPhone: cellController.text,
      email: emailController.text,
      userType: '',
      uid: '',
    );
  }

  Future<void> onSavePressed(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      // Registrar no Firebase Authentication
      final userId = await _authService.registerUser(
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text,
      );

      await _db
          .collection('users')
          .doc(userId)
          .set({
            'name': nameController.text,
            'birthDate': birthDate,
            'cellphone': cellController.text,
            'email': emailController.text,
          })
          .then((value) => print('cadastrado'))
          .catchError((erro) => print('deu erro $erro'));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuário cadastrado com sucesso"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao cadastrar usuário: $e")),
      );
    }
  }
}
