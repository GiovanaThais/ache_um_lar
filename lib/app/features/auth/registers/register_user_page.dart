import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

import '../../../core/services/shared_preferences/app_storage_service.dart';
import 'widgets/formatters_widget.dart';
import 'widgets/person_components.dart';
import 'widgets/text_label_widget.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({
    super.key,
  });

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  var nameController = TextEditingController(text: "");
  var birthDateController = TextEditingController(text: "");

  var cellController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");

  DateTime? birthDate;
  var types = [];
  var typeSelected = "";

  AppStorageService storage = AppStorageService();
  final String NAME_REGISTRATER_DATA_KEY = "NAME_REGISTRATER_DATA_KEY";
  final String NUMBERID_REGISTRATER_DATA_KEY = "NUMBERID_REGISTRATER_DATA_KEY";
  final String CELLPHONE_REGISTRATER_DATA_KEY =
      "CELLPHONE_REGISTRATER_DATA_KEY";
  final String BIRTHDATE_REGISTRATER_DATA_KEY =
      "BIRTHDATE_REGISTRATER_DATA_KEY";
  final String EMAIL_REGISTRATER_DATA_KEY = "EMAIL_REGISTRATER_DATA_KEY";
  final String PASSWORD_REGISTRATER_DATA_KEY = "PASSWORD_REGISTRATER_DATA_KEY";

  bool safing = false;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    nameController.text = await storage.getRegisterDataName();
    emailController.text = await storage.getRegisterEmail();
    passwordController.text = await storage.getRegisterPassword();

    birthDateController.text = await storage.getRegisterBirthday();
    if (birthDateController.text.isNotEmpty) {
      birthDate = DateTime.parse(birthDateController.text);
    }

    cellController.text = await storage.getRegisterCellphone();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabel(
                  controller: nameController,
                  textlabel: "Nome Completo",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabelFormatter(
                  controller: cellController,
                  textlabelFormatter: "Telefone",
                  formatter: TelefoneInputFormatter(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text("Data de nascimento:",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  readOnly: true,
                  controller: birthDateController,
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900, 1, 1),
                        lastDate: DateTime.now());
                    if (date != null) {
                      birthDateController.text = date.toString();
                      birthDate = date;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabel(
                  controller: emailController,
                  textlabel: "Email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabel(
                  controller: passwordController,
                  textlabel: "Senha",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabel(
                  controller: passwordController,
                  textlabel: "Confirmar Senha",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _onSavePressed,
                    child: const Text("Salvar"),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  void _onSavePressed() async {
    if (nameController.text.trim().length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Nome deve ser preenchido")));
      return;
    }
    if (birthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Data de nascimento deve ser preenchida!")));
      return;
    }

    if (cellController.text.trim().length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Telefone deve ser adicionado!")));
      return;
    }

    await storage.setRegisterDataName(nameController.text);
    await storage.setRegisterCellphone(cellController.text);
    await storage.setRegisterBirthday(birthDateController.text);
    await storage.setRegisterEmail(emailController.text);
    await storage.setRegisterPassword(passwordController.text);

    setState(() {
      safing = true;
    });
    // Future.delayed(const Duration(seconds: 3), () {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("Dados salvo com sucesso")));
    //         setState(() {
    //             safing = false;
    //               });
    //               Navigator.pop(context);
    //               });
    //             },
    //             child: Text("Salvar"),
    //     ),
    //     ],
    //     ),
    //   }
  }
}
