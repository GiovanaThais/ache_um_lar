// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../home/models/card_home_model.dart';

// class PropertyService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<CardHomeModel>> getProperties() async {
//     try {
//       final querySnapshot = await _firestore.collection('properties').get();
//       return querySnapshot.docs
//           .map((doc) => CardHomeModel.fromFirestore(doc))
//           .toList();
//     } catch (e) {
//       throw Exception('Erro ao buscar propriedades: $e');
//     }
//   }
// }
