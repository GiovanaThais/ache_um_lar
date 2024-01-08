// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/add_homes_form_controller.dart';
import '../widgets/text_field_widget.dart';

class AddHomesFormComponent extends StatefulWidget {
  const AddHomesFormComponent({
    Key? key,
    required this.formController,
  }) : super(key: key);
  final AddHomesFormController formController;

  @override
  State<AddHomesFormComponent> createState() => _AddHomesFormComponentState();
}

class _AddHomesFormComponentState extends State<AddHomesFormComponent> {
  String imagePath = "";

  AddHomesFormController get formController => widget.formController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: ListView(
        children: [
          InkWell(
            child: imagePath.isEmpty
                ? const Icon(Icons.add_a_photo)
                : Image.file(File(imagePath)),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          title: Text("Camera"),
                          leading: Icon(Icons.photo_camera),
                          onTap: () async {
                            final _imagePath =
                                await formController.pickerImage("cam");
                            setState(() {
                              imagePath = _imagePath;
                            });
                          },
                        ),
                        ListTile(
                          title: Text("Galeria"),
                          leading: Icon(Icons.photo_library),
                          onTap: () async {
                            final _imagePath =
                                await formController.pickerImage("gallery");
                            setState(() {
                              imagePath = _imagePath;
                            });
                          },
                        )
                      ],
                    );
                  });
            },
          ),
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
                  prefixIcon: Icons.bed,
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
