// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/add_homes_form_controller.dart';
import '../widgets/check_more_info_widget.dart';
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

  List<String> imovelDetails = [
    'Área de serviço',
    'Armários no quarto',
    'Armários na cozinha',
    'Mobiliado',
    'Ar condicionado',
    'Churrasqueira',
    'Varanda',
    'Academia',
    'Piscina',
    'Quarto de serviço',
  ];

  List<String> condominiumDetails = [
    'Condomínio fechado',
    'Elevador',
    'Segurança 24h',
    'Portaria',
    'Permitido animais',
    'Academia (cond.)',
    'Piscina (cond.)',
    'Salão de festas',
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: ListView(
        children: [
          InkWell(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 118, 118, 118)
                      .withOpacity(0.7), // Cor da borda com opacidade
                  width: 1.5, // Largura da borda
                ),
              ),
              child: Center(
                child: imagePath.isEmpty
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt,
                              size: 40, color: Color.fromARGB(255, 92, 92, 92)),
                          SizedBox(height: 8),
                          Text(
                            'Adicionar\nFoto',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 118, 118, 118),
                                fontSize: 12),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(imagePath),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        title: const Text("Câmera"),
                        leading: const Icon(Icons.photo_camera),
                        onTap: () async {
                          final _imagePath =
                              await formController.pickerImage("cam");
                          setState(() {
                            imagePath = _imagePath;
                          });
                          Navigator.pop(
                              context); // Fechar o BottomSheet após a seleção
                        },
                      ),
                      ListTile(
                        title: const Text("Galeria"),
                        leading: const Icon(Icons.photo_library),
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
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
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
          TextFieldWidget(
            controller: formController.condominiumTaxController,
            label: 'Taxa de condomínio: (R\$)',
            validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            controller: formController.iptuController,
            label: 'IPTU (R\$)',
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
          const SizedBox(width: 20),
          Expanded(
            child: CheckMoreInfoWidget(
              title: 'Detalhes do imóvel',
              detailsList: imovelDetails,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CheckMoreInfoWidget(
              title: 'Detalhes do condomínio',
              detailsList: condominiumDetails,
            ),
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
