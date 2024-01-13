import 'dart:convert';
import 'dart:ffi';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CardHomeModel {
  final String name;
  final String urlImage;
  final String city;
  final String address;
  final String price;
  late final bool? isFav;
  final String description;
  final int bedRooms;
  final int bathRooms;
  final int garages;
  final double sqFeet;
  List<String>? moreImagesUrl;

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
    this.isFav,
    this.moreImagesUrl,
  });

  CardHomeModel copyWith({
    String? name,
    String? urlImage,
    String? city,
    String? address,
    String? description,
    int? bedRooms,
    int? bathRooms,
    int? garages,
    double? sqFeet,
    Bool? isFav,
    List<String>? moreImagesUrl,
  }) {
    return CardHomeModel(
        name: name ?? this.name,
        urlImage: urlImage ?? this.urlImage,
        city: city ?? this.city,
        address: address ?? this.address,
        price: price ?? this.price,
        description: address ?? this.address,
        bedRooms: bedRooms ?? this.bedRooms,
        bathRooms: bathRooms ?? this.bathRooms,
        garages: garages ?? this.garages,
        sqFeet: sqFeet ?? this.sqFeet,
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
        name: map['name'] as String,
        urlImage: map['urlImage'] as String,
        city: '',
        address: '',
        price: '',
        isFav: map['isFav'] as bool?,
        description: '',
        bedRooms: 0,
        bathRooms: 0,
        garages: 0,
        sqFeet: 0,
        moreImagesUrl: map['moreImagesUrl']);
  }

  String toJson() => json.encode(toMap());

  factory CardHomeModel.fromJson(String source) =>
      CardHomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
