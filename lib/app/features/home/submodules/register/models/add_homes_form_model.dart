class PropertyModel {
  final String address;
  final String city;
  final String state;
  final String number;
  final String neighborhood;
  final String cep;
  final String country;
  final double price;
  final double iptu;
  final double condominiumTax;
  final int bedrooms;
  final int bathrooms;
  final String description;
  final List<String> imageUrls;

  PropertyModel({
    required this.address,
    required this.city,
    required this.state,
    required this.number,
    required this.neighborhood,
    required this.cep,
    required this.country,
    required this.price,
    required this.iptu,
    required this.condominiumTax,
    required this.bedrooms,
    required this.bathrooms,
    required this.description,
    required this.imageUrls,
  });
  factory PropertyModel.fromFormData({
    required String address,
    required String city,
    required String state,
    required String number,
    required String neighborhood,
    required String cep,
    required String country,
    required double price,
    required double iptu,
    required double condominiumTax,
    required int bedrooms,
    required int bathrooms,
    required String description,
    required List<String> imageUrls,
  }) {
    return PropertyModel(
      address: address,
      city: city,
      state: state,
      number: number,
      neighborhood: neighborhood,
      cep: cep,
      country: country,
      price: price,
      iptu: iptu,
      condominiumTax: condominiumTax,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      description: description,
      imageUrls: imageUrls,
    );
  }
}
