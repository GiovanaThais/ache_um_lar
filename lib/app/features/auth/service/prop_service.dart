// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';

// class PropertyService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<CardHomeModel>> getProperties() async {
//     try {
//       final querySnapshot = await _firestore.collection('properties').get();
//       return querySnapshot.docs.map((doc) {
//         final data = doc.data();
//         return CardHomeModel(
//           id: doc.id,
//           name: data['name'] ?? '',
//           urlImage: data['urlImage'] ?? '',
//           city: data['city'] ?? '',
//           address: data['address'] ?? '',
//           numberAddress: data['numberAddress'] ?? '',
//           neighborhood: data['neighborhood'] ?? '',
//           price: data['price']?.toString() ?? '',
//           isFav: false, // Esse valor será atualizado mais tarde
//           description: data['description'] ?? '',
//           bedRooms: data['bedrooms']?.toString() ?? '',
//           bathRooms: data['bathrooms']?.toString() ?? '',
//           garages: data['garages']?.toString() ?? '',
//           sqFeet: data['sqFeet']?.toString() ?? '',
//           iptu: data['iptu']?.toString() ?? '',
//           condominiumTax: data['condominiumTax']?.toString() ?? '',
//           moreImagesUrl: List<String>.from(data['moreImagesUrl'] ?? []),
//           category: data['category'] ?? '',
//         );
//       }).toList();
//     } catch (e) {
//       print('Erro ao carregar propriedades: $e');
//       return [];
//     }
//   }
// }
