import 'package:flutter/material.dart';

import 'components/add_homes_form_components.dart';

class AddHomesFormPage extends StatelessWidget {
  const AddHomesFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Imóvel'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: AddHomesFormComponent(),
      ),
    );
  }
}
