import 'dart:io';

import 'package:flutter/material.dart';

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
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 250),
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemCount: imagePaths.length + 1,
              itemBuilder: (context, index) {
                if (index == imagePaths.length) {
                  return GestureDetector(
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
                                  final imagePath = await formController.pickerImage("cam");
                                  setState(() {
                                    imagePaths.add(imagePath);
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: const Text("Galeria"),
                                leading: const Icon(Icons.photo_library),
                                onTap: () async {
                                  final imagePath = await formController.pickerImage("gallery");
                                  setState(() {
                                    imagePaths.add(imagePath);
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 226, 226, 226).withOpacity(0.7),
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Color.fromARGB(255, 86, 86, 86),
                        ),
                      ),
                    ),
                  );
                }
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(File(imagePaths[index])),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            imagePaths.removeAt(index);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 2),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: theme.colorScheme.onPrimary,
            child: ExpansionTile(
              iconColor:
                  const Color.fromARGB(255, 220, 167, 255), // Cor da setinha quando o ExpansionTile está expandido
              collapsedIconColor: const Color.fromARGB(255, 238, 161, 248),
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        controller: formController.cityController,
                        label: 'Cidade',
                        validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              controller: formController.stateController,
                              label: 'Estado',
                              validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFieldWidget(
                              controller: formController.countryController,
                              label: 'País',
                              validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        controller: formController.addressController,
                        label: 'Logradouro',
                        validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        controller: formController.cepController,
                        label: 'CEP',
                        validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              controller: formController.neighborhoodController,
                              label: 'Bairro',
                              validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFieldWidget(
                              controller: formController.numberAddressController,
                              label: 'Número',
                              validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
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
            color: theme.colorScheme.onPrimary,
            child: ExpansionTile(
              iconColor:
                  const Color.fromARGB(255, 220, 167, 255), // Cor da setinha quando o ExpansionTile está expandido
              collapsedIconColor: const Color.fromARGB(255, 238, 161, 248),
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RowFormatters(
                        label: 'Preço (R\$)',
                        formatter: formController.priceFormatter,
                        controller: formController.priceController,
                      ),
                      const SizedBox(height: 20),
                      RowFormatters(
                        label: 'Taxa de condomínio (R\$)',
                        formatter: formController.condominiumTaxFormatter,
                        controller: formController.condominiumTaxController,
                      ),
                      const SizedBox(height: 20),
                      RowFormatters(
                        label: 'IPTU (R\$)',
                        formatter: formController.iptuFormatter,
                        controller: formController.iptuController,
                      ),
                      const SizedBox(height: 20),
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
            color: theme.colorScheme.onPrimary,
            child: ExpansionTile(
              iconColor:
                  const Color.fromARGB(255, 220, 167, 255), // Cor da setinha quando o ExpansionTile está expandido
              collapsedIconColor:
                  const Color.fromARGB(255, 238, 161, 248), // Cor da setinha quando o ExpansionTile está colapsado
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
                  padding: const EdgeInsets.all(20),
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
                                validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            child: Expanded(
                              child: TextFieldWidget(
                                controller: formController.bathroomsController,
                                label: 'Banheiros',
                                prefixIcon: Icons.bathtub,
                                validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Container(
                      //   child: Expanded(
                      //     child: TextFieldWidget(
                      //       controller: formController.bathroomsController,
                      //       label: 'Garagem',
                      //       prefixIcon: Icons.garage,
                      //       validator: (value) =>
                      //           defaultValidator(value, 'Campo Obrigatório'),
                      //     ),
                      //   ),
                      // ),
                      TextFieldWidget(
                        controller: formController.propertyCodeController,
                        label: 'Garagem',
                        // maxLines: 3,
                        //keyboardType: TextInputType.multiline,
                        validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        controller: formController.propertyCodeController,
                        label: 'Código do Imóvel(Opcional)',
                        // maxLines: 3,
                        //keyboardType: TextInputType.multiline,
                        validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        controller: formController.descriptionController,
                        label: 'Descrição',
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        validator: (value) => defaultValidator(value, 'Campo Obrigatório'),
                      ),
                      DropdownButtonFormField<String>(
                        value: formController.selectedCategory,
                        items: ['Casa', 'Apartamento']
                            .map((label) => DropdownMenuItem(
                                  value: label,
                                  child: Text(label),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            formController.selectedCategory = value ?? 'Casa';
                          });
                        },
                        decoration: const InputDecoration(labelText: 'Categoria'),
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
              onPressed: () => formController.addProperties(context),
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
