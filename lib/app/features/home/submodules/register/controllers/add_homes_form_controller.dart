import 'dart:io';

import 'package:ache_um_lar/app/core/services/image_picker_service.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController sqfeetController = TextEditingController();
  final TextEditingController garageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final ImagePickerService imagePickerService;
  String selectedCategory = 'Casa';
  String? houseId;
  List<File> imageFiles = [];
  List<String> imageUrl = [];
  List<String> imageUrlToRemove = [];
  Map<String, String> imageRef = {};

  AddHomesFormController(this.imagePickerService);

  Future<void> removeImage(String url) async {
    if (url.startsWith('http')) {
      imageUrlToRemove.add(url);
    }
  }

  Future<void> removeImageFromFirebase() async {
    for (var element in imageUrlToRemove) {
      if (element.startsWith('http')) {
        Reference ref = FirebaseStorage.instance.ref(imageRef[element]);
        await ref.delete().then((value) {
          imageRef.remove(element);
          imageUrl.remove(element);
        });
      }
    }
  }

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
      await removeImageFromFirebase();
      final (imageUrls, imageRefs) = await _uploadImages(imageFiles);
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
        'sqfeet': sqfeetController,
        'garage': garageController,
        'name': nameController,
        'images': [...imageUrl, ...imageUrls], // Adicionar URLs das imagens
        'imagesRef': [...imageRef.values, ...imageRefs],
        'createdAt': FieldValue.serverTimestamp(),
      };

      if (houseId != null && houseId!.isNotEmpty) {
        // Salvar no Firestore
        await FirebaseFirestore.instance
            .collection('properties')
            .doc(houseId)
            .update(propertiesData);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Imóvel atualizado com sucesso!')));
      } else {
        await FirebaseFirestore.instance
            .collection('properties')
            .add(propertiesData);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Imóvel adicionado com sucesso!')));
      }
      print('Dados da casa salvos com sucesso');
    } on FirebaseException catch (e) {
      print('Erro ao adicionar imóvel: $e');
    }
  }

  Future<(List<String>, List<String>)> _uploadImages(
      List<File> imageFiles) async {
    List<String> imageUrls = [];
    List<String> imageRefs = [];
    for (File imageFile in imageFiles) {
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference ref =
          FirebaseStorage.instance.ref().child('properties/').child(fileName);
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': imageFile.path},
      );

      await ref.putFile(imageFile, metadata);
      String downloadUrl = await ref.getDownloadURL();
      imageUrls.add(downloadUrl);
      imageRefs.add(ref.fullPath);
    }
    return (imageUrls, imageRefs);
  }
}
