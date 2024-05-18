import 'dart:convert';

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
  final double iptu;
  final double condominiumTax;

  CardHomeModel({
    required this.id,
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

  void toggleFavorite() {
    isFav = !isFav;
  }

  CardHomeModel copyWith({
    String? id,
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
      id: id ?? this.id,
      name: name ?? this.name,
      urlImage: urlImage ?? this.urlImage,
      city: city ?? this.city,
      address: address ?? this.address,
      price: price,
      description: description ?? this.description,
      bedRooms: bedRooms ?? this.bedRooms,
      bathRooms: bathRooms ?? this.bathRooms,
      garages: garages ?? this.garages,
      sqFeet: sqFeet ?? this.sqFeet,
      isFav: isFav ?? this.isFav,
      moreImagesUrl: moreImagesUrl ?? this.moreImagesUrl,
      iptu: iptu ?? this.iptu,
      condominiumTax: condominiumTax ?? this.condominiumTax,
      cep: cep ?? this.cep,
      numberAddress: numberAddress ?? this.numberAddress,
      neighborhood: neighborhood ?? this.neighborhood,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'urlImage': urlImage,
      // 'city': city,
      // 'address': address,
      // 'numberAddress': numberAddress,
      // 'neighborhood': neighborhood,
      // 'cep': cep,
      // 'price': price,
      // 'isFav': isFav,
      // 'description': description,
      // 'bedRooms': bedRooms,
      // 'bathRooms': bathRooms,
      // 'garages': garages,
      // 'sqFeet': sqFeet,
      // 'moreImagesUrl': moreImagesUrl,
      // 'iptu': iptu,
      // 'condominiumTax': condominiumTax,
    };
  }

  factory CardHomeModel.fromMap(Map<String, dynamic> map) {
    return CardHomeModel(
      id: map['id'],
      name: map['name'],
      urlImage: map['urlImage'],
      city: '',
      address: '',
      price: '',
      isFav: map['isFav'] ?? false,
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
      moreImagesUrl: map['moreImagesUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CardHomeModel.fromJson(String source) =>
      CardHomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
