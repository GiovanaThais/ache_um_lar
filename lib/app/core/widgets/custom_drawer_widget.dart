//import 'package:dart_bank/features/auth/register/register_page.dart';
//import 'package:dart_bank/features/home/pages/setting_page.dart';

import 'package:ache_um_lar/app/core/theme/light/light_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../features/auth/service/auth_service_firebase.dart';
import '../../features/home/presenter/pages/help_page.dart';

//import '../../../features/auth/login/login_page.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: itemsDrawerMethod(context),
      ),
    );
  }

  Column itemsDrawerMethod(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        avatarAccountMethod(context),
        loginMethod(),
        const Divider(),
        registerUserMethod(),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        useTermsMethod(context),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        settingsMethod(context),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        exitMethod(context),
      ],
    );
  }

  InkWell loginMethod() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.person),
            SizedBox(
              width: 5,
            ),
            Text("Entrar"),
          ],
        ),
      ),
      onTap: () {
        Modular.to.pushNamed('/auth/login');
      },
    );
  }

  InkWell exitMethod(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.exit_to_app),
            SizedBox(
              width: 5,
            ),
            Text("Sair"),
          ],
        ),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                alignment: Alignment.centerLeft,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text("MyImmoble"),
                content: const Wrap(
                  children: [
                    Text("Voce sairá do aplicativo!"),
                    Text("Deseja realmente sair do aplicativo?"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Não")),
                  TextButton(
                      onPressed: () {
                        AuthServiceFirebase().logOut();
                        Modular.to.pushNamed('/auth/login');
                      },
                      child: const Text("Sim"))
                ],
              );
            });
      },
    );
  }

  InkWell settingsMethod(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.settings),
            SizedBox(
              width: 5,
            ),
            Text("Configurações"),
          ],
        ),
      ),
      onTap: () {
        bool isBrazilSelected = false;
        bool isMexicoSelected = false;
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          context: context,
          builder: (BuildContext bc) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle accessibility button tap
                        },
                        icon: const Icon(Icons.accessibility_new_rounded),
                        label: const Text("Acessibilidade"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle "Sobre nós" button tap
                        },
                        icon: const Icon(Icons.info),
                        label: const Text("Sobre nós"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HelpPage()),
                          );
                        },
                        icon: const Icon(Icons.help),
                        label: const Text("Ajuda"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          alterCountryMethod(
                              context, isBrazilSelected, isMexicoSelected);
                        },
                        icon: const Icon(Icons.language),
                        label: const Text("Alterar País"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> alterCountryMethod(
      BuildContext context, bool isBrazilSelected, bool isMexicoSelected) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                children: [
                  const Text(
                    "Alterar o país",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    " Onde você deseja buscar um imovél?",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: isBrazilSelected,
                        onChanged: (bool? value) {
                          // Handle Brazil checkbox change
                          isBrazilSelected = value ?? false;
                        },
                      ),
                      const Text("Brasil"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isMexicoSelected,
                        onChanged: (bool? value) {
                          // Handle Mexico checkbox change
                          isMexicoSelected = value ?? false;
                        },
                      ),
                      const Text("México"),
                    ],
                  ),
                ],
              ));
        });
  }

  InkWell useTermsMethod(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.info),
            SizedBox(
              width: 5,
            ),
            Text("Termos de uso e privacidade"),
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            context: context,
            builder: (BuildContext bc) {
              return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: const Column(
                    children: [
                      Text(
                        "Termos de uso e privacidade",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        " Podemos já vislumbrar o modo pelo qual a mobilidade dos capitais internacionais ainda não demonstrou convincentemente que vai participar na mudança das regras de conduta normativas. A certificação de metodologias que nos auxiliam a lidar com o novo modelo estrutural aqui  proposições. atuação assume importantes posições no estabelecimento das direções preferenciais no sentido do progresso.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ));
            });
      },
    );
  }

  InkWell registerUserMethod() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.edit),
            SizedBox(
              width: 5,
            ),
            Text("Dados cadastráis"),
          ],
        ),
      ),
      onTap: () {
        Modular.to.pushNamed('/auth/registerUser');
      },
    );
  }

  InkWell avatarAccountMethod(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            context: context,
            builder: (BuildContext bc) {
              return const Wrap(
                children: [
                  ListTile(
                    title: Text("Camera"),
                    leading: Icon(Icons.photo_camera),
                  ),
                  ListTile(
                    title: Text("Galeria"),
                    leading: Icon(Icons.photo_library),
                  )
                ],
              );
            });
      },
      child: UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: LightColors.lightPurple,
            child: Image.asset(
              'assets/icons/avatar.png',
              width: 60,
            ),
          ),
          accountName: const Text("User"),
          accountEmail: const Text("email@email.com")),
    );
  }
}
