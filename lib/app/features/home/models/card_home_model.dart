import 'dart:convert';
import 'dart:ffi';

class CardHomeModel {
  final String name;
  final String urlImage;
  final String city;
  final String address;
  final String? numberAddress;
  final String? neighborhood;
  final String? cep;
  final String price;
  final bool isFav;
  final String description;
  final String bedRooms;
  final String bathRooms;
  final int garages;
  final double sqFeet;
  List<String> moreImagesUrl;
  final double iptu;
  final double condominiumTax;

  CardHomeModel({
    required this.name,
    required this.urlImage,
    required this.city,
    required this.address,
    required this.price,
    required this.description,
    required this.bedRooms,
    required this.bathRooms,
    required this.garages,
    required this.sqFeet,
    this.cep,
    this.neighborhood,
    this.numberAddress,
    this.isFav = false,
    this.moreImagesUrl = const [],
    required this.iptu,
    required this.condominiumTax,
  });

  CardHomeModel copyWith({
    String? name,
    String? urlImage,
    String? city,
    String? address,
    String? cep,
    String? numberAddress,
    String? neighborhood,
    String? description,
    String? bedRooms,
    String? bathRooms,
    int? garages,
    double? sqFeet,
    bool? isFav,
    List<String>? moreImagesUrl,
    double? iptu,
    double? condominiumTax,
  }) {
    return CardHomeModel(
        name: name ?? this.name,
        urlImage: urlImage ?? this.urlImage,
        city: city ?? this.city,
        address: address ?? this.address,
        price: price,
        description: address ?? this.address,
        bedRooms: bedRooms ?? this.bedRooms,
        bathRooms: bathRooms ?? this.bathRooms,
        garages: garages ?? this.garages,
        sqFeet: sqFeet ?? this.sqFeet,
        iptu: iptu ?? this.iptu,
        condominiumTax: condominiumTax ?? this.condominiumTax,
        cep: cep ?? this.cep,
        numberAddress: numberAddress ?? this.numberAddress,
        neighborhood: neighborhood ?? this.neighborhood,
        moreImagesUrl: moreImagesUrl ?? this.moreImagesUrl);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'urlImage': urlImage,
    };
  }

  factory CardHomeModel.fromMap(Map<String, dynamic> map) {
    return CardHomeModel(
        // add novas
        name: map['name'],
        urlImage: map['urlImage'],
        city: '',
        address: '',
        price: '',
        isFav: map['isFav'],
        description: '',
        bedRooms: '',
        bathRooms: '',
        cep: '',
        numberAddress: '',
        neighborhood: '',
        garages: 0,
        sqFeet: 0,
        iptu: 0,
        condominiumTax: 0,
        moreImagesUrl: map['moreImagesUrl']);
  }

  String toJson() => json.encode(toMap());

  factory CardHomeModel.fromJson(String source) =>
      CardHomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
