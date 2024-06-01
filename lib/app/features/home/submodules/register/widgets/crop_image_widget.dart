import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
//import 'package:gallery_saver/gallery_saver.dart';

// class cropImagesWidget extends StatefulWidget {
//   const cropImagesWidget({super.key});

//   @override
//   State<cropImagesWidget> createState() => _cropImagesWidgetState();
// }

// class _cropImagesWidgetState extends State<cropImagesWidget> {
//   XFile? photo;

//   cropImage(XFile imageFile) async {
//     CroppedFile? croppedFile = await ImageCropper().cropImage(
//       sourcePath: imageFile.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.deepOrange,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         IOSUiSettings(
//           title: 'Cropper',
//         ),
//       ],
//     );
//     if (croppedFile != null) {
//       await GallerySaver.saveImage(croppedFile.path);
//       photo = XFile(croppedFile.path);
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class CropImages {
  static Future<String?> cropImage(String imagePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Editar Imagem',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
          minimumAspectRatio: 1.0,
        ),
      ],
      // androidUiSettings: AndroidUiSettings(
      //     toolbarTitle: 'Editar Imagem',
      //     toolbarColor: Colors.deepOrange,
      //     toolbarWidgetColor: Colors.white,
      //     initAspectRatio: CropAspectRatioPreset.original,
      //     lockAspectRatio: false),
      // iosUiSettings: IOSUiSettings(
      //   minimumAspectRatio: 1.0,
      // ),
    );

    if (croppedImage != null) {
      return croppedImage.path;
    } else {
      return null;
    }
  }
}
