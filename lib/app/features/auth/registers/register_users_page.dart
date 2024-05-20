import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'register_user_controller.dart';
import 'widgets/formatters_widget.dart';
import 'widgets/text_label_widget.dart';
import 'package:intl/intl.dart';

class RegisterUsersPage extends StatefulWidget {
  const RegisterUsersPage({Key? key}) : super(key: key);

  @override
  State<RegisterUsersPage> createState() => _RegisterUsersPageState();
}

class _RegisterUsersPageState extends State<RegisterUsersPage> {
  final controller = RegisterUserController();
  bool _isPasswordVisible = false;

  String? _selectedOption;
  final _imagePicker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedOption = "Cliente";
  }

  @override
  Widget build(BuildContext context) {
    controller.loadData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _imageFile != null ? FileImage(_imageFile!) : null,
                  child: _imageFile == null
                      ? const Icon(Icons.person, size: 50)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
                hintText: 'Digite seu nome completo',
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
                  if (value.length < 5) {
                    return "O telefone está muito curto!";
                  }

                  return null;
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                "Data de nascimento:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
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
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    controller.birthDateController.text =
                        DateFormat('dd/MM/yyyy').format(date);
                    controller.birthDate = date;
                  }
                },
              ),
            ),
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
                    if (value.length < 5) {
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
              child: Wrap(
                children: [
                  Wrap(
                    children: [
                      Radio(
                        value: "Empresa",
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value as String?;
                            controller.userDataNotifier.value.userType =
                                "Empresa";
                          });
                        },
                      ),
                      const Text("Empresa"),
                      const SizedBox(width: 20),
                      Radio(
                        value: "Corretor",
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value as String?;
                            controller.userDataNotifier.value.userType =
                                "Corretor";
                          });
                        },
                      ),
                      const Text("Corretor"),
                      const SizedBox(width: 20),
                      Radio(
                        value: "Cliente",
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value as String?;
                            controller.userDataNotifier.value.userType =
                                "Cliente";
                          });
                        },
                      ),
                      const Text("Cliente"),
                    ],
                  ),
                  Visibility(
                    visible: _selectedOption == "Empresa",
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextLabel(
                controller: controller.passwordController,
                textlabel: "Senha",
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "A senha deve ser preenchida";
                  }
                  if (value.length < 8) {
                    return "A senha deve conter no mínimo 8 caracteres!";
                  }
                  return null;
                },
                obscureText: !_isPasswordVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextLabel(
                controller: controller.passwordController,
                textlabel: "Confirmar Senha",
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "A senha deve ser preenchida";
                  }
                  if (value.length < 8) {
                    return "A senha deve conter no mínimo 8 caracteres!";
                  }
                  return null;
                },
                obscureText: !_isPasswordVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _takePhoto,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
