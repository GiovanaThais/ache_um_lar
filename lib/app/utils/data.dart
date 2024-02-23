import 'package:flutter/material.dart';

class HouseData {
  final String image;
  final String name;
  final String price;
  final String location;
  final String address;
  final String description;
  final int bedRooms;
  final int bathRooms;
  final int garages;
  final double sqFeet;
  final bool isFavorite;
  List<String>? moreImagesUrl;
  final double iptu;
  final double condominiumTax;

  HouseData({
    required this.image,
    required this.name,
    required this.price,
    required this.location,
    required this.address,
    required this.isFavorite,
    required this.description,
    required this.bedRooms,
    required this.bathRooms,
    required this.garages,
    required this.sqFeet,
    this.moreImagesUrl,
    required this.iptu,
    required this.condominiumTax,
  });
}

List<HouseData> popular = [
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/casa-isolada-no-campo_1303-23773.jpg?w=1380&t=st=1704563798~exp=1704564398~hmac=923a6ab50345b26fbbe06e6992fae57516746d43a4c4dc0760b7339dff8317e1",
    name: "Single Villa",
    price: "580k",
    location: "Aracaju, Sergipe",
    description: '',
    bedRooms: 4,
    bathRooms: 3,
    garages: 2,
    sqFeet: 416,
    isFavorite: true,
    address: 'Rua A, N10,Bairro B',
    iptu: 2.000,
    moreImagesUrl: [
      "https://img.freepik.com/fotos-gratis/casa-isolada-no-campo_1303-23773.jpg?w=1380&t=st=1704563798~exp=1704564398~hmac=923a6ab50345b26fbbe06e6992fae57516746d43a4c4dc0760b7339dff8317e1",
      'https://img.freepik.com/fotos-gratis/3d-renderizacao-loft-sala-de-estar-escandinava-com-mesa-de-trabalho-e-estante_105762-2094.jpg',
      'https://planner5d.com/blog/content/images/2023/05/pexels-vecislavas-popa-1571459-1.jpg',
      "https://img.freepik.com/fotos-gratis/desenho-interior-de-cozinha-bonito_23-2150976557.jpg?w=996&t=st=1705258979~exp=1705259579~hmac=dcf0faf00f2e12606770111e7618d4a176a07c17513d4980ce30f9185d16bf63"
    ],
    condominiumTax: 500,
  ),
  HouseData(
    image:
        "https://casacor.abril.com.br/wp-content/uploads/sites/7/2022/01/Casa-Liu-Raiz-Arquitetura-Foto-Leonardo-Giantomasi-2.jpg?quality=90&strip=info",
    name: "Convertible Studio",
    price: "550k",
    location: "Aracaju, Sergipe",
    description: '',
    bedRooms: 4,
    bathRooms: 2,
    garages: 2,
    sqFeet: 416,
    isFavorite: false,
    address: 'Rua B, N2, Bairro B',
    iptu: 2.000,
    moreImagesUrl: [
      "https://casacor.abril.com.br/wp-content/uploads/sites/7/2022/01/Casa-Liu-Raiz-Arquitetura-Foto-Leonardo-Giantomasi-2.jpg?quality=90&strip=info",
      'https://i.pinimg.com/564x/05/3b/d0/053bd0e10819c0d8f2605f579dbda9fc.jpg'
    ],
    condominiumTax: 500,
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/villa-com-piscina-de-luxo-espetacular-design-contemporaneo-arte-digital-imoveis-casa-casa-e-propriedade-ge_1258-150749.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704153600&semt=sph",
    name: "Twin Castle",
    price: "475k",
    location: "Aracaju, Sergipe",
    description: '',
    bedRooms: 4,
    bathRooms: 2,
    garages: 2,
    sqFeet: 216,
    isFavorite: false,
    address: 'Rua C, N6,Bairro B',
    iptu: 2.000,
    moreImagesUrl: [
      "https://img.freepik.com/fotos-gratis/villa-com-piscina-de-luxo-espetacular-design-contemporaneo-arte-digital-imoveis-casa-casa-e-propriedade-ge_1258-150749.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704153600&semt=sph",
      "https://www.tuacasa.com.br/wp-content/uploads/2021/11/decoracao-de-sala-0.jpg",
      "https://revistamatrimoni.com.br/wp-content/uploads/2024/01/733e09ab-eb62-4866-8782-23af16fd21cb.jpg"
    ],
    condominiumTax: 500,
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/design-house-villa-moderna-com-sala-de-estar-em-plano-aberto-e-ala-de-quarto-privado-grande-terraco-com-privacidade_1258-169741.jpg?w=1380&t=st=1704563873~exp=1704564473~hmac=e2f6c5d9e1bf5614f7ba225f11b8a0120174eb42afd92e4c2988ee02822d6a23",
    name: "Garden Villa",
    price: "620k",
    location: "Aracaju, Sergipe",
    description: 'Lorem Ipsum is simply dummy text of the printing ',
    bedRooms: 5,
    bathRooms: 2,
    garages: 2,
    sqFeet: 416,
    isFavorite: false,
    address: 'Rua D, N8,Bairro B',
    iptu: 2.000,
    moreImagesUrl: [
      "https://img.freepik.com/fotos-gratis/design-house-villa-moderna-com-sala-de-estar-em-plano-aberto-e-ala-de-quarto-privado-grande-terraco-com-privacidade_1258-169741.jpg?w=1380&t=st=1704563873~exp=1704564473~hmac=e2f6c5d9e1bf5614f7ba225f11b8a0120174eb42afd92e4c2988ee02822d6a23",
      "https://img.freepik.com/fotos-gratis/renderizacao-3d-moderna-sala-de-jantar-e-sala-de-estar-com-decoracao-de-luxo-e-sofa-verde_105762-2140.jpg?w=1380&t=st=1705258817~exp=1705259417~hmac=79044c4537f9181ccf5251b7eae3a53be6fa8ab09f642e1a8875582eb546660e"
    ],
    condominiumTax: 500,
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/arquitetura-moderna-de-apartamentos_1268-14696.jpg?w=1380&t=st=1704563949~exp=1704564549~hmac=fc1479315a2b262d80a039bf07bf5366553156f02120efeaf43adba1476a6b6b",
    name: "Twin Villa",
    price: "390k",
    location: "Aracaju, Sergipe",
    description: '',
    bedRooms: 4,
    bathRooms: 3,
    garages: 2,
    sqFeet: 216,
    isFavorite: true,
    address: 'Rua A, N8,Bairro B',
    iptu: 2.000,
    moreImagesUrl: [
      "https://img.freepik.com/fotos-gratis/arquitetura-moderna-de-apartamentos_1268-14696.jpg?w=1380&t=st=1704563949~exp=1704564549~hmac=fc1479315a2b262d80a039bf07bf5366553156f02120efeaf43adba1476a6b6b",
      'https://media.istockphoto.com/id/1293762741/pt/foto/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=k-tUeeOObCH5eXkzesP6-jfMkJ2pnMIaU4YpclAjgAA=',
      'https://www.estilofontana.com.br/blog/wp-content/uploads/2021/02/Cozinha-Americana.jpg'
    ],
    condominiumTax: 500,
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/aconchegante-sala-de-estar-de-um-apartamento-moderno_181624-58445.jpg?w=1380&t=st=1704563749~exp=1704564349~hmac=4ccf8ba46a290fc750ec10db9d5f0a7cecb301ff7bcea7a26287b0ef0b37678e",
    name: "Twin Villa",
    price: "320k",
    location: "Aracaju, Sergipe",
    description: '',
    bedRooms: 4,
    bathRooms: 2,
    garages: 2,
    sqFeet: 216,
    isFavorite: false,
    address: 'Rua A, N8,Bairro B',
    iptu: 2.000,
    moreImagesUrl: [
      "https://img.freepik.com/fotos-gratis/aconchegante-sala-de-estar-de-um-apartamento-moderno_181624-58445.jpg?w=1380&t=st=1704563749~exp=1704564349~hmac=4ccf8ba46a290fc750ec10db9d5f0a7cecb301ff7bcea7a26287b0ef0b37678e",
      "https://img.freepik.com/fotos-gratis/quarto-vazio-moderno-com-mobilia_23-2149178335.jpg?w=1380&t=st=1705258925~exp=1705259525~hmac=70689709189512df145d0bea790371a2fd06216f36aa8f52b3bd040ccae4d2ba"
    ],
    condominiumTax: 500,
  ),
];

List<String> categoryList = [
  '<\$220.00',
  'Casas',
  '3-4 quartos',
  'Apartamentos',
];
