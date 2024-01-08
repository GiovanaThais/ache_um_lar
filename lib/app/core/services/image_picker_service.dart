import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<File> pickerImageFromGallery();
  Future<File> pickerImageFromCam();
}

class ImagePickerServiceImpl implements ImagePickerService {
  final ImagePicker _imagePicker;

  ImagePickerServiceImpl({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;
  @override
  Future<File> pickerImageFromCam() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        throw Exception('Não foi possivel capturar a imagem');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<File> pickerImageFromGallery() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        throw Exception('Não foi possivel capturar a imagem');
      }
    } catch (e) {
      rethrow;
    }
  }
}
