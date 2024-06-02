import 'dart:developer';

import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PropertyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<CardHomeModel>> getProperties() async {
    try {
      final querySnapshot = await _firestore.collection('properties').orderBy('createdAt', descending: true).get();
      var list = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return CardHomeModel(
          id: doc.id,
          name: data['name'] ?? '',
          urlImage: data['urlImage'] ?? '',
          city: data['city'] ?? '',
          address: data['address'] ?? '',
          cep: data['cep'] ?? '',
          numberAddress: data['numberAddress'] ?? '',
          neighborhood: data['neighborhood'] ?? '',
          price: data['price']?.toString() ?? '',
          isFav: false, // Esse valor será atualizado mais tarde
          description: data['description'] ?? '',
          bedRooms: data['bedrooms']?.toString() ?? '',
          bathRooms: data['bathrooms']?.toString() ?? '',
          garages: int.tryParse(data['garages']?.toString() ?? '0') ?? 0,
          sqFeet: double.tryParse(data['sqFeet']?.toString() ?? '0') ?? 0,
          iptu: double.tryParse(data['iptu']?.toString() ?? '0') ?? 0,
          condominiumTax: double.tryParse(data['condominiumTax']?.toString() ?? '0') ?? 0,
          moreImagesUrl: List<String>.from(data['images'] ?? []),
          imagesRef: List<String>.from(data['imagesRef'] ?? []),
          // category: data['category'] ?? '',
        );
      }).toList();
      return list;
    } catch (e) {
      print('Erro ao carregar propriedades: $e');
      return [];
    }
  }

  Future<void> deleteProperty(CardHomeModel model) async {
    try {
      for (var element in model.imagesRef) {
        final ref = _storage.ref(element);
        await ref.delete();
      }
      await _firestore.collection('properties').doc(model.id).delete();
    } catch (e) {
      log(e.toString());
    }
  }
}
