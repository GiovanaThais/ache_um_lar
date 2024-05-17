import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';

import '../controllers/add_homes_form_controller.dart';
import '../widgets/check_more_info_widget.dart';
import '../widgets/row_formatters_widget.dart';
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
  List<String> imagePaths = [];

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
    final theme = Theme.of(context);
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
            height: 10,
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 9, horizontal: 2),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: theme.colorScheme.secondaryContainer,
            child: ExpansionTile(
              title: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Endereço',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 143, 143, 143),
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        controller: formController.cityController,
                        label: 'Cidade',
                        validator: (value) =>
                            defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              controller: formController.stateController,
                              label: 'Estado',
                              validator: (value) =>
                                  defaultValidator(value, 'Campo Obrigatório'),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFieldWidget(
                              controller: formController.countryController,
                              label: 'País',
                              validator: (value) =>
                                  defaultValidator(value, 'Campo Obrigatório'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFieldWidget(
                        controller: formController.addressController,
                        label: 'Logradouro',
                        validator: (value) =>
                            defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      SizedBox(height: 20),
                      TextFieldWidget(
                        controller: formController.cepController,
                        label: 'CEP',
                        validator: (value) =>
                            defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              controller: formController.neighborhoodController,
                              label: 'Bairro',
                              validator: (value) =>
                                  defaultValidator(value, 'Campo Obrigatório'),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFieldWidget(
                              controller:
                                  formController.numberAddressController,
                              label: 'Número',
                              validator: (value) =>
                                  defaultValidator(value, 'Campo Obrigatório'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 2),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: theme.colorScheme.secondaryContainer,
            child: ExpansionTile(
              title: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Informações Financeiras',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 143, 143, 143),
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RowFormatters(
                        label: 'Preço (R\$)',
                        formatter: formController.priceFormatter,
                      ),
                      SizedBox(height: 20),
                      RowFormatters(
                        label: 'Taxa de condomínio (R\$)',
                        formatter: formController.condominiumTaxFormatter,
                      ),
                      SizedBox(height: 20),
                      RowFormatters(
                        label: 'IPTU (R\$)',
                        formatter: formController.iptuFormatter,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Card(
            margin: EdgeInsets.symmetric(vertical: 9, horizontal: 2),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: theme.colorScheme.secondaryContainer,
            child: ExpansionTile(
              title: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Características do Imóvel',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 143, 143, 143),
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Expanded(
                              child: TextFieldWidget(
                                controller: formController.bedroomsController,
                                label: 'Quartos',
                                prefixIcon: Icons.bed,
                                validator: (value) => defaultValidator(
                                    value, 'Campo Obrigatório'),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            child: Expanded(
                              child: TextFieldWidget(
                                controller: formController.bathroomsController,
                                label: 'Banheiros',
                                prefixIcon: Icons.bathtub,
                                validator: (value) => defaultValidator(
                                    value, 'Campo Obrigatório'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      RowFormatters(
                        label: 'Código do Imóvel(Opcional)',
                        formatter: formController.condominiumTaxFormatter,
                      ),
                      SizedBox(height: 20),
                      TextFieldWidget(
                        controller: formController.descriptionController,
                        label: 'Descrição',
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        validator: (value) =>
                            defaultValidator(value, 'Campo Obrigatório'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Center(
            child: Expanded(
              child: CheckMoreInfoWidget(
                title: 'Detalhes do imóvel',
                detailsList: imovelDetails,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Center(
            child: Expanded(
              child: CheckMoreInfoWidget(
                title: 'Detalhes do condomínio',
                detailsList: condominiumDetails,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => formController.addProperties(),
              child: const Text('Cadastrar'),
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
