import 'package:ache_um_lar/app/core/components/snackbar_componets.dart';
import 'package:ache_um_lar/app/core/services/shared_preferences/app_storage_company_service.dart';
import 'package:ache_um_lar/app/features/auth/service/auth_service_firebase.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../widgets/formatters_widget.dart';
import '../widgets/text_label_widget.dart';

class RegisterCompanyPage extends StatefulWidget {
  const RegisterCompanyPage({
    super.key,
  });

  @override
  State<RegisterCompanyPage> createState() => _RegisterCompanyPageState();
}

class _RegisterCompanyPageState extends State<RegisterCompanyPage> {
  String _selectedOption = "Imobiliária";

  var nameCompanyController = TextEditingController(text: "");
  var cnpjController = TextEditingController(text: "");

  var cellCompanyController = TextEditingController(text: "");
  var creciController = TextEditingController(text: "");
  var emailCompanyController = TextEditingController(text: "");
  var passwordCompanyController = TextEditingController(text: "");

  // AuthServiceFirebase _authService = AuthServiceFirebase();
  FirebaseFirestore company = FirebaseFirestore.instance;

  var types = [];
  var typeSelected = "";

  // AppStorageCompanyService storage = AppStorageCompanyService();
  // final String NAME_COMPANY_REGISTRATER_DATA_KEY =
  //     "NAME_COMPANY_REGISTRATER_DATA_KEY";
  // final String NUMBERID_REGISTRATER_DATA_KEY =
  //     "NUMBERID_COMPANY_REGISTRATER_DATA_KEY";
  // final String CELLPHONE_COMPANY_REGISTRATER_DATA_KEY =
  //     "CELLPHONE_COMPANY_REGISTRATER_DATA_KEY";
  // final String CNPJ_COMPANY_REGISTRATER_DATA_KEY = "CNPJ_REGISTRATER_DATA_KEY";
  // final String CRECI_REGISTRATER_DATA_KEY = "CRECI_REGISTRATER_DATA_KEY";
  // final String EMAIL_COMPANY_REGISTRATER_DATA_KEY =
  //     "EMAIL_COMPANY_REGISTRATER_DATA_KEY";
  // final String PASSWORD_COMPANY_REGISTRATER_DATA_KEY =
  //     "PASSWORD_COMPANY_REGISTRATER_DATA_KEY";

  bool safing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    //loadData();
  }

  //loadData() async {
  // nameController.text = await storage.getRegisterCompanyDataName();
  // emailController.text = await storage.getRegisterCompanyEmail();
  // passwordController.text = await storage.getRegisterCompanyPassword();
  // creciController.text = await storage.getRegisterCreci();
  // cnpjController.text = await storage.getRegisterCnpj();

  // cellController.text = await storage.getRegisterCompanyCellphone();

  //  setState(() {});
  // }

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
                  controller: nameCompanyController,
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
                  controller: cellCompanyController,
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
                        });
                      },
                    ),
                    Text("Imobiliária"),
                    SizedBox(width: 20),
                    Radio(
                      value: "Corretor",
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    Text("Corretor"),
                  ],
                ),
              ),
              Visibility(
                visible: _selectedOption == "Imobiliária",
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.5),
                  child: Form(
                    child: TextFormField(
                      controller: cnpjController,
                      decoration: InputDecoration(labelText: "CNPJ"),
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
                      controller: creciController,
                      decoration: InputDecoration(labelText: "CRECI"),
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 12.0),
              //   child: Form(
              //     //key: _formKey,
              //     child: TextLabel(
              //       controller: cnpjController,
              //       textlabel: "Cnpj",
              //       validator: null,
              //     ),
              //   ),
              // ),
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
                  key: _formKey,
                  child: TextLabel(
                    controller: emailCompanyController,
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
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabel(
                  controller: passwordCompanyController,
                  textlabel: "Senha",
                  validator: (String? value) {
                    if (value == null) {
                      return "A senha deve ser preenchida";
                    }
                    if (value.length < 8) {
                      return "O senha deve conter no mínimo 8 caracteres!";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabel(
                  controller: passwordCompanyController,
                  textlabel: "Confirmar Senha",
                  validator: (String? value) {
                    if (value == null) {
                      return "O e-mail deve ser preenchido";
                    }
                    if (value.length < 8) {
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
    String names = nameCompanyController.text;
    String emails = emailCompanyController.text;
    String passwords = passwordCompanyController.text;

    if (nameCompanyController.text.trim().length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Nome deve ser preenchido")));
      return;
    }
    if (cnpjController.text == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cnpj deve ser preenchido!")));
      return;
    }

    if (cellCompanyController.text.trim().length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Telefone deve ser adicionado!")));
      return;
    }
    // print(
    //     "${emailController.text},${passwordController.text}, ${nameController.text}");
    // _authService
    //     .registerUser(
    //   name: names,
    //   password: passwords,
    //   email: emails,
    // )
    //     .then((String? erro) {
    //   if (erro != null) {
    //     showSnacksBar(context: context, message: erro);
    //   } else {
    //     showSnacksBar(
    //       context: context,
    //       message: "Cadastro efetuado com sucesso",
    //       isError: false,
    //     );
    //   }
    // });
    // setState(() {
    //   safing = true;
    // });

    String id = const Uuid().v1();
    try {
      await company
          .collection("companies")
          .doc(id)
          .set({
            'name': nameCompanyController.text,
            'cnpj': cnpjController,
            'cellphone': cellCompanyController.text,
            'email': emailCompanyController.text,
          })
          .then((value) => print('cadastrado'))
          .catchError((erro) => print('deu erro $erro'));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário cadastrado com sucesso")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao cadastrar usuário: $e")),
      );
    }

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
