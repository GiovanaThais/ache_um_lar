import 'package:ache_um_lar/app/features/home/presenter/pages/help_page.dart';
import 'package:flutter/material.dart';

import '../widgets/country_bottom_sheet_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isBrazilSelected = false;

  bool? isMexicoSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: const Icon(Icons.accessibility_new_rounded,
                      color: Colors.purple),
                  title: const Text("Acessibilidade"),
                  hoverColor: theme.colorScheme.primary,
                  splashColor: theme.colorScheme.primary,
                  selectedColor: theme.colorScheme.primary,
                  focusColor: theme.colorScheme.primary,
                  textColor: theme.colorScheme.primary,
                  onTap: () {
                    // Handle the tap on this item
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                    leading:
                        const Icon(Icons.business_sharp, color: Colors.purple),
                    title: const Text("Sobre nós"),
                    hoverColor: theme.colorScheme.primary,
                    splashColor: theme.colorScheme.primary,
                    selectedColor: theme.colorScheme.primary,
                    focusColor: theme.colorScheme.primary,
                    textColor: theme.colorScheme.primary,
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              child: const Column(
                                children: [
                                  Text(
                                    "Sobre nós",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "A empresa oferece uma experiência direta, simples e transparente para quem busca alugar, comprar ou vender um imóvel, facilita a marcação de visitas,  os inquilinos alugam com facilidade, e os compradores têm maior transparência ao longo de toda a transação.A plataforma realiza uma transação a cada 25 minutos, evidenciando sua eficiência e movimentação constante no setor..",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                    leading: const Icon(Icons.language, color: Colors.purple),
                    title: const Text("Alterar País"),
                    hoverColor: theme.colorScheme.primary,
                    splashColor: theme.colorScheme.primary,
                    selectedColor: theme.colorScheme.primary,
                    focusColor: theme.colorScheme.primary,
                    textColor: theme.colorScheme.primary,
                    onTap: () {
                      showModalMethod(context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showModalMethod(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      context: context,
      builder: (BuildContext bc) {
        return CountryBottomSheetWidget(
          onBrazilSelected: (value) {
            setState(() {
              isBrazilSelected = value;
            });
          },
          onMexicoSelected: (value) {
            setState(() {
              isMexicoSelected = value;
            });
          },
        );
      },
    );
  }
}
