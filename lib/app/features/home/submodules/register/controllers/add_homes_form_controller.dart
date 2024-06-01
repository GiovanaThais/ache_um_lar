import 'dart:io';

import 'package:ache_um_lar/app/core/services/image_picker_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';

class AddHomesFormController {
  final TextEditingController addressController =
      TextEditingController(); //logradouro
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController =
      TextEditingController(); //Estado
  final TextEditingController numberAddressController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController iptuController = TextEditingController();
  final TextEditingController condominiumTaxController =
      TextEditingController();
  final TextEditingController bedroomsController = TextEditingController();
  final TextEditingController bathroomsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RealInputFormatter priceFormatter = RealInputFormatter(moeda: true);
  final RealInputFormatter condominiumTaxFormatter =
      RealInputFormatter(moeda: true);
  final RealInputFormatter iptuFormatter = RealInputFormatter(moeda: true);
  final TextEditingController propertyCodeController = TextEditingController();

  final ImagePickerService imagePickerService;
  String selectedCategory = 'Casa';
  List<File> imageFiles = [];
  AddHomesFormController(this.imagePickerService);

  Future<String> pickerImage(String source) async {
    File? file;
    if (source == 'cam') {
      file = await imagePickerService.pickerImageFromCam();
    } else {
      file = await imagePickerService.pickerImageFromGallery();
    }
    if (file != null) {
      imageFiles.add(file);
    }
    return file?.path ?? '';
  }

  Future<void> addProperties(BuildContext context) async {
    try {
      final price = double.tryParse(
          priceController.text.replaceAll(RegExp(r'[^\d.]'), ''));
      final iptu = double.tryParse(
          iptuController.text.replaceAll(RegExp(r'[^\d.]'), ''));
      final condominiumTax = double.tryParse(
          condominiumTaxController.text.replaceAll(RegExp(r'[^\d.]'), ''));

      // Verificando se a conversão foi bem-sucedida
      if (price == null || iptu == null || condominiumTax == null) {
        print(
            'Erro na conversão dos valores de preço, iptu ou condominiumTax.');
        return;
      }

      // Verificando se a conversão foi bem-sucedida
      if (price == null || iptu == null || condominiumTax == null) {
        print(
            'Erro na conversão dos valores de preço, iptu ou condominiumTax.');
        return;
      }
      List<String> imageUrls = await _uploadImages(imageFiles);
      // Dados do imóvel
      final propertiesData = {
        'city': cityController.text,
        'state': stateController.text,
        'country': countryController.text,
        'address': addressController.text,
        'cep': cepController.text,
        'neighborhood': neighborhoodController.text,
        'number': numberAddressController.text,
        'bedrooms': bedroomsController.text,
        'bathrooms': bathroomsController.text,
        'description': descriptionController.text,
        'price': price,
        'condominiumTax': condominiumTax,
        'iptu': iptu,
        'category': selectedCategory,
        'images': imageUrls, // Adicionar URLs das imagens
      };

      // Salvar no Firestore
      await FirebaseFirestore.instance
          .collection('properties')
          .add(propertiesData);
      print('Dados da casa salvos com sucesso');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Imóvel adicionado com sucesso!')));
    } on FirebaseException catch (e) {
      print('Erro ao adicionar imóvel: $e');
    }
  }

  Future<List<String>> _uploadImages(List<File> imageFiles) async {
    List<String> imageUrls = [];
    for (File imageFile in imageFiles) {
      String fileName =
          'properties/${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference ref = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }
}
