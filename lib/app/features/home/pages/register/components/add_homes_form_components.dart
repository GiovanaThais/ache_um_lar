import 'package:flutter/material.dart';

import '../controllers/add_homes_form_controller.dart';
import '../widgets/text_field_widget.dart';

class AddHomesFormComponent extends StatelessWidget {
  const AddHomesFormComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formController = AddHomesFormController();

    return Form(
      key: GlobalKey<FormState>(),
      child: ListView(
        children: [
          TextFieldWidget(
            controller: formController.addressController,
            label: 'Endereço',
            validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            controller: formController.priceController,
            label: 'Preço (R\$)',
            validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  controller: formController.bedroomsController,
                  label: 'Quartos',
                  prefixIcon: Icons.king_bed,
                  validator: (value) =>
                      defaultValidator(value, 'Campo Obrigatório'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFieldWidget(
                  controller: formController.bathroomsController,
                  label: 'Banheiros',
                  prefixIcon: Icons.bathtub,
                  validator: (value) =>
                      defaultValidator(value, 'Campo Obrigatório'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            controller: formController.descriptionController,
            label: 'Descrição',
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => formController.addProperties(),
              child: const Text('Adicionar'),
            ),
          ),
        ],
      ),
    );
  }

  String? defaultValidator(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
