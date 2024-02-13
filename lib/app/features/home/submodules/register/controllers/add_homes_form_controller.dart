import 'package:ache_um_lar/app/core/services/image_picker_service.dart';
import 'package:flutter/material.dart';

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

  final ImagePickerService imagePickerService;
  Future<String> pickerImage(String source) async {
    if (source == 'cam') {
      final file = await imagePickerService.pickerImageFromCam();
      return file.path;
    } else {
      final file = await imagePickerService.pickerImageFromGallery();
      return file.path;
    }
  }

  AddHomesFormController(this.imagePickerService);
  Future<void> addProperties() async {
    // Lógica para salvar o imóvel
  }
}
