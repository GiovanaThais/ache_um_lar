import 'package:ache_um_lar/app/features/home/submodules/register/register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/add_homes_form_components.dart';

class AddHomesFormPage extends StatelessWidget {
  const AddHomesFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Imóvel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddHomesFormComponent(
          formController: context.read(),
        ),
      ),
    );
  }
}
