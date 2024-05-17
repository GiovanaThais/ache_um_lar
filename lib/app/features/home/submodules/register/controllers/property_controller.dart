import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/add_homes_form_model.dart';

class PropertyController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProperty(PropertyModel property) async {
    try {
      await _db.collection('properties').add({
        'address': property.address,
        'city': property.city,
        'state': property.state,
        'number': property.number,
        'neighborhood': property.neighborhood,
        'cep': property.cep,
        'country': property.country,
        'price': property.price,
        'iptu': property.iptu,
        'condominiumTax': property.condominiumTax,
        'bedrooms': property.bedrooms,
        'bathrooms': property.bathrooms,
        'description': property.description,
        'imageUrls': property.imageUrls,
      });
      print('Dados da casa salvos com sucesso');
    } catch (e) {
      print('Erro ao salvar os dados da casa: $e');
      throw e;
    }
  }
}
