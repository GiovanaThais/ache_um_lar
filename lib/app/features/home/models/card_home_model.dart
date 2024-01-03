import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CardHomeModel {
  final String name;
  final String urlImage;
  final String city;
  final String address;
  final String price;

  CardHomeModel({
    required this.name,
    required this.urlImage,
    required this.city,
    required this.address,
    required this.price,
  });

  CardHomeModel copyWith({
    String? name,
    String? urlImage,
    String? city,
    String? address,
  }) {
    return CardHomeModel(
      name: name ?? this.name,
      urlImage: urlImage ?? this.urlImage,
      city: city ?? this.city,
      address: address ?? this.address,
      price: '',
    );
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
    );
  }

  String toJson() => json.encode(toMap());

  factory CardHomeModel.fromJson(String source) =>
      CardHomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
