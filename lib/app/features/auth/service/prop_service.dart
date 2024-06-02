import 'dart:developer';

import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PropertyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<CardHomeModel>> getProperties(List<String> favoriteList) async {
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
          isFav: favoriteList.contains(doc.id), // Esse valor será atualizado mais tarde
          description: data['description'] ?? '',
          bedRooms: data['bedrooms']?.toString() ?? '',
          bathRooms: data['bathrooms']?.toString() ?? '',
          garages: int.tryParse(data['garages']?.toString() ?? '0') ?? 0,
          sqFeet: double.tryParse(data['sqFeet']?.toString() ?? '0') ?? 0,
          iptu: double.tryParse(data['iptu']?.toString() ?? '0') ?? 0,
          condominiumTax: double.tryParse(data['condominiumTax']?.toString() ?? '0') ?? 0,
          moreImagesUrl: List<String>.from(data['images'] ?? []),
          imagesRef: List<String>.from(data['imagesRef'] ?? []),
          category: data['category'] ?? 'Todas',
        );
      }).toList();
      return list;
    } catch (e) {
      print('Erro ao carregar propriedades: $e');
      return [];
    }
  }

  Future<List<CardHomeModel>> getPropertiesFilter(List<String> favoriteList, String categoryFilter) async {
    try {
      final querySnapshot = await _firestore
          .collection('properties')
          .where('category', isEqualTo: categoryFilter)
          .orderBy('createdAt', descending: true)
          .get();
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
          isFav: favoriteList.contains(doc.id), // Esse valor será atualizado mais tarde
          description: data['description'] ?? '',
          bedRooms: data['bedrooms']?.toString() ?? '',
          bathRooms: data['bathrooms']?.toString() ?? '',
          garages: int.tryParse(data['garages']?.toString() ?? '0') ?? 0,
          sqFeet: double.tryParse(data['sqFeet']?.toString() ?? '0') ?? 0,
          iptu: double.tryParse(data['iptu']?.toString() ?? '0') ?? 0,
          condominiumTax: double.tryParse(data['condominiumTax']?.toString() ?? '0') ?? 0,
          moreImagesUrl: List<String>.from(data['images'] ?? []),
          imagesRef: List<String>.from(data['imagesRef'] ?? []),
          category: data['category'] ?? 'Todas',
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

  Future<void> saveFavoriteId(String userId, String propertyId) async {
    try {
      await _firestore.collection('favorites').doc(userId).collection('favoritesId').add({
        'id': propertyId,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Erro ao salvar favorito: $e');
    }
  }

  Future<List<CardHomeModel>> getFavorites(String userId) async {
    try {
      final querySnapshotFavorites = await _firestore
          .collection('favorites')
          .doc(userId)
          .collection('favoritesId')
          .orderBy('createdAt', descending: true)
          .get();
      final listId = querySnapshotFavorites.docs.map((e) => e.data()['id'] ?? '');
      final querySnapshot = await _firestore
          .collection('properties')
          .where(FieldPath.documentId, whereIn: listId)
          .orderBy('createdAt', descending: true)
          .get();
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
          category: data['category'] ?? 'Todas',
        );
      }).toList();
      return list;
    } catch (e) {
      print('Erro ao carregar propriedades: $e');
      return [];
    }
  }
}
