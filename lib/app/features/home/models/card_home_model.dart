import 'dart:convert';

import 'package:flutter/foundation.dart';

class CardHomeModel {
  final String id; // Adiciona um identificador único para cada item
  final String name;
  final String urlImage;
  final String city;
  final String address;
  final String? numberAddress;
  final String? neighborhood;
  final String? cep;
  final String price;
  bool isFav; // Torna mutável para suportar atualização
  final String description;
  final String bedRooms;
  final String bathRooms;
  final int garages;
  final double sqFeet;
  List<String> moreImagesUrl;
  List<String> imagesRef;
  final double iptu;
  final String category; // Nova propriedade para categoria
  final double condominiumTax;

  CardHomeModel({
    required this.id,
    required this.name,
    required this.urlImage,
    required this.city,
    required this.address,
    this.numberAddress,
    this.neighborhood,
    this.cep,
    required this.price,
    this.isFav = false,
    required this.description,
    required this.bedRooms,
    required this.bathRooms,
    required this.garages,
    required this.sqFeet,
    this.moreImagesUrl = const [],
    this.imagesRef = const [],
    required this.iptu,
    this.category = '',
    required this.condominiumTax,
  });

  void toggleFavorite() {
    isFav = !isFav;
  }

  CardHomeModel copyWith({
    String? id,
    String? name,
    String? urlImage,
    String? city,
    String? address,
    ValueGetter<String?>? numberAddress,
    ValueGetter<String?>? neighborhood,
    ValueGetter<String?>? cep,
    String? price,
    bool? isFav,
    String? description,
    String? bedRooms,
    String? bathRooms,
    int? garages,
    double? sqFeet,
    List<String>? moreImagesUrl,
    List<String>? imagesRef,
    double? iptu,
    String? category,
    double? condominiumTax,
  }) {
    return CardHomeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      urlImage: urlImage ?? this.urlImage,
      city: city ?? this.city,
      address: address ?? this.address,
      numberAddress: numberAddress != null ? numberAddress() : this.numberAddress,
      neighborhood: neighborhood != null ? neighborhood() : this.neighborhood,
      cep: cep != null ? cep() : this.cep,
      price: price ?? this.price,
      isFav: isFav ?? this.isFav,
      description: description ?? this.description,
      bedRooms: bedRooms ?? this.bedRooms,
      bathRooms: bathRooms ?? this.bathRooms,
      garages: garages ?? this.garages,
      sqFeet: sqFeet ?? this.sqFeet,
      moreImagesUrl: moreImagesUrl ?? this.moreImagesUrl,
      imagesRef: imagesRef ?? this.imagesRef,
      iptu: iptu ?? this.iptu,
      category: category ?? this.category,
      condominiumTax: condominiumTax ?? this.condominiumTax,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'urlImage': urlImage,
      'city': city,
      'address': address,
      'numberAddress': numberAddress,
      'neighborhood': neighborhood,
      'cep': cep,
      'price': price,
      'isFav': isFav,
      'description': description,
      'bedRooms': bedRooms,
      'bathRooms': bathRooms,
      'garages': garages,
      'sqFeet': sqFeet,
      'moreImagesUrl': moreImagesUrl,
      'imagesRef': imagesRef,
      'iptu': iptu,
      'category': category,
      'condominiumTax': condominiumTax,
    };
  }

  factory CardHomeModel.fromMap(Map<String, dynamic> map) {
    return CardHomeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      urlImage: map['urlImage'] ?? '',
      city: map['city'] ?? '',
      address: map['address'] ?? '',
      numberAddress: map['numberAddress'],
      neighborhood: map['neighborhood'],
      cep: map['cep'],
      price: map['price'] ?? '',
      isFav: map['isFav'] ?? false,
      description: map['description'] ?? '',
      bedRooms: map['bedRooms'] ?? '',
      bathRooms: map['bathRooms'] ?? '',
      garages: map['garages']?.toInt() ?? 0,
      sqFeet: map['sqFeet']?.toDouble() ?? 0.0,
      moreImagesUrl: List<String>.from(map['moreImagesUrl']),
      imagesRef: List<String>.from(map['imagesRef']),
      iptu: map['iptu']?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      condominiumTax: map['condominiumTax']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardHomeModel.fromJson(String source) => CardHomeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CardHomeModel(id: $id, name: $name, urlImage: $urlImage, city: $city, address: $address, numberAddress: $numberAddress, neighborhood: $neighborhood, cep: $cep, price: $price, isFav: $isFav, description: $description, bedRooms: $bedRooms, bathRooms: $bathRooms, garages: $garages, sqFeet: $sqFeet, moreImagesUrl: $moreImagesUrl, imagesRef: $imagesRef, iptu: $iptu, category: $category, condominiumTax: $condominiumTax)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CardHomeModel &&
      other.id == id &&
      other.name == name &&
      other.urlImage == urlImage &&
      other.city == city &&
      other.address == address &&
      other.numberAddress == numberAddress &&
      other.neighborhood == neighborhood &&
      other.cep == cep &&
      other.price == price &&
      other.isFav == isFav &&
      other.description == description &&
      other.bedRooms == bedRooms &&
      other.bathRooms == bathRooms &&
      other.garages == garages &&
      other.sqFeet == sqFeet &&
      listEquals(other.moreImagesUrl, moreImagesUrl) &&
      listEquals(other.imagesRef, imagesRef) &&
      other.iptu == iptu &&
      other.category == category &&
      other.condominiumTax == condominiumTax;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      urlImage.hashCode ^
      city.hashCode ^
      address.hashCode ^
      numberAddress.hashCode ^
      neighborhood.hashCode ^
      cep.hashCode ^
      price.hashCode ^
      isFav.hashCode ^
      description.hashCode ^
      bedRooms.hashCode ^
      bathRooms.hashCode ^
      garages.hashCode ^
      sqFeet.hashCode ^
      moreImagesUrl.hashCode ^
      imagesRef.hashCode ^
      iptu.hashCode ^
      category.hashCode ^
      condominiumTax.hashCode;
  }
}
