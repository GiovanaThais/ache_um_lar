import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel {
  final String id;
  final String name;
  final String urlImage;
  final String city;
  final String address;
  final String numberAddress;
  final String neighborhood;
  final String price;
  late bool isFav;
  final String description;
  final String bedRooms;
  final String bathRooms;
  final String garages;
  final String sqFeet;
  final String iptu;
  final String condominiumTax;
  final List<String> moreImagesUrl;
  final String category; // Nova propriedade para categoria

  CardModel({
    required this.id,
    required this.name,
    required this.urlImage,
    required this.city,
    required this.address,
    required this.numberAddress,
    required this.neighborhood,
    required this.price,
    required this.isFav,
    required this.description,
    required this.bedRooms,
    required this.bathRooms,
    required this.garages,
    required this.sqFeet,
    required this.iptu,
    required this.condominiumTax,
    required this.moreImagesUrl,
    required this.category,
  });

  factory CardModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return CardModel(
      id: doc.id,
      name: data['name'] ?? '',
      urlImage: data['urlImage'] ?? '',
      city: data['city'] ?? '',
      address: data['address'] ?? '',
      numberAddress: data['numberAddress'] ?? '',
      neighborhood: data['neighborhood'] ?? '',
      price: data['price']?.toString() ?? '',
      isFav:
          false, // Inicializar com false, o valor real será atualizado posteriormente
      description: data['description'] ?? '',
      bedRooms: data['bedrooms']?.toString() ?? '',
      bathRooms: data['bathrooms']?.toString() ?? '',
      garages: data['garages']?.toString() ?? '',
      sqFeet: data['sqFeet']?.toString() ?? '',
      iptu: data['iptu']?.toString() ?? '',
      condominiumTax: data['condominiumTax']?.toString() ?? '',
      moreImagesUrl: List<String>.from(data['moreImagesUrl'] ?? []),
      category: data['category'] ??
          'Todas', // Certifique-se de que a categoria é tratada
    );
  }

  void toggleFavorite() {
    isFav = !isFav;
  }
}
