import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

import 'register_user_controller.dart';
import 'widgets/formatters_widget.dart';
import 'widgets/text_label_widget.dart';

class RegisterUsersPage extends StatefulWidget {
  const RegisterUsersPage({Key? key}) : super(key: key);

  @override
  State<RegisterUsersPage> createState() => _RegisterUsersPageState();
}

class _RegisterUsersPageState extends State<RegisterUsersPage> {
  @override
  Widget build(BuildContext context) {
    final controller = RegisterUserController();
    controller.loadData();

    String? _selectedOption = "Imobiliária";
    if (_selectedOption == null) {
      controller.userDataNotifier.value.userType = "cliente";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextLabel(
                controller: controller.nameController,
                textlabel: "Nome Completo",
                validator: (String? value) {
                  if (value == null) {
                    return "O nome deve ser preenchido";
                  }
                  if (value.length < 2) {
                    return "O nome está muito curto!";
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextLabelFormatter(
                controller: controller.cellController,
                textlabelFormatter: "Telefone",
                formatter: TelefoneInputFormatter(),
                validator: (String? value) {
                  if (value == null) {
                    return "O telefone deve ser preenchido";
                  }
                  if (value!.length < 5) {
                    return "O telefone está muito curto!";
                  }

                  return null;
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text("Data de nascimento:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                readOnly: true,
                controller: controller.birthDateController,
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000, 1, 1),
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime.now());
                  if (date != null) {
                    controller.birthDateController.text = date.toString();
                    controller.birthDate = date;
                  }
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 12.0),
            //   child: Form(
            //     //key: _formKey,
            //     child: TextLabel(
            //       controller: creciController,
            //       textlabel: "Creci",
            //       validator: null,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Form(
                key: controller.formKey,
                child: TextLabel(
                  controller: controller.emailController,
                  textlabel: "Email",
                  validator: (String? value) {
                    if (value == null) {
                      return "O e-mail deve ser preenchido";
                    }
                    if (value!.length < 5) {
                      return "O e-mail está muito curto!";
                    }
                    if (!value.contains("@")) {
                      return "O e-mail não é válido";
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio(
                    value: "Imobiliária",
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        controller.userDataNotifier.value.userType = "empresa";
                      });
                    },
                  ),
                  const Text("Imobiliária"),
                  const SizedBox(width: 20),
                  Radio(
                    value: "Corretor",
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        controller.userDataNotifier.value.userType = "corretor";
                      });
                    },
                  ),
                  const Text("Corretor"),
                ],
              ),
            ),
            Visibility(
              visible: _selectedOption == "Imobiliária",
              child: Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: Form(
                  child: TextFormField(
                    controller: controller.cnpjController,
                    decoration: const InputDecoration(labelText: "CNPJ"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _selectedOption == "Corretor",
              child: Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: Form(
                  child: TextFormField(
                    controller: controller.creciController,
                    decoration: const InputDecoration(labelText: "CRECI"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextLabel(
                controller: controller.passwordController,
                textlabel: "Senha",
                validator: (String? value) {
                  if (value == null) {
                    return "A senha deve ser preenchida";
                  }
                  if (value!.length < 8) {
                    return "O senha deve conter no mínimo 8 caracteres!";
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextLabel(
                controller: controller.passwordController,
                textlabel: "Confirmar Senha",
                validator: (String? value) {
                  if (value == null) {
                    return "O e-mail deve ser preenchido";
                  }
                  if (value!.length < 8) {
                    return "O senha deve conter no mínimo 8 caracteres!";
                  }

                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => controller.onSavePressed(context),
                  child: const Text("Salvar"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
