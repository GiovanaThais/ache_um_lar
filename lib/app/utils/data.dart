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
  final bool isFavorited;
  List<String>? moreImagesUrl;

  HouseData({
    required this.image,
    required this.name,
    required this.price,
    required this.location,
    required this.address,
    required this.isFavorited,
    required this.description,
    required this.bedRooms,
    required this.bathRooms,
    required this.garages,
    required this.sqFeet,
    this.moreImagesUrl,
  });
}

List<HouseData> popular = [
  HouseData(
      image:
          "https://img.freepik.com/fotos-gratis/casa-isolada-no-campo_1303-23773.jpg?w=1380&t=st=1704563798~exp=1704564398~hmac=923a6ab50345b26fbbe06e6992fae57516746d43a4c4dc0760b7339dff8317e1",
      name: "Single Villa",
      price: "280k",
      location: "Aracaju, Sergipe",
      description: '',
      bedRooms: 4,
      bathRooms: 3,
      garages: 2,
      sqFeet: 1.416,
      isFavorited: true,
      address: 'Rua A, N0,Bairro B',
      moreImagesUrl: [
        'https://img.freepik.com/fotos-gratis/3d-renderizacao-loft-sala-de-estar-escandinava-com-mesa-de-trabalho-e-estante_105762-2094.jpg',
        'https://planner5d.com/blog/content/images/2023/05/pexels-vecislavas-popa-1571459-1.jpg',
      ]),
  HouseData(
      image:
          "https://casacor.abril.com.br/wp-content/uploads/sites/7/2022/01/Casa-Liu-Raiz-Arquitetura-Foto-Leonardo-Giantomasi-2.jpg?quality=90&strip=info",
      name: "Convertible Studio",
      price: "250k",
      location: "Aracaju, Sergipe",
      description: '',
      bedRooms: 4,
      bathRooms: 2,
      garages: 2,
      sqFeet: 1.416,
      isFavorited: false,
      address: 'Rua A, N0, Bairro B',
      moreImagesUrl: [
        'https://i.pinimg.com/564x/05/3b/d0/053bd0e10819c0d8f2605f579dbda9fc.jpg'
      ]),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/villa-com-piscina-de-luxo-espetacular-design-contemporaneo-arte-digital-imoveis-casa-casa-e-propriedade-ge_1258-150749.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704153600&semt=sph",
    name: "Twin Castle",
    price: "275k",
    location: "Aracaju, Sergipe",
    description: '',
    bedRooms: 4,
    bathRooms: 2,
    garages: 2,
    sqFeet: 1.416,
    isFavorited: false,
    address: 'Rua A, N0,Bairro B',
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/design-house-villa-moderna-com-sala-de-estar-em-plano-aberto-e-ala-de-quarto-privado-grande-terraco-com-privacidade_1258-169741.jpg?w=1380&t=st=1704563873~exp=1704564473~hmac=e2f6c5d9e1bf5614f7ba225f11b8a0120174eb42afd92e4c2988ee02822d6a23",
    name: "Garden Villa",
    price: "320k",
    location: "Aracaju, Sergipe",
    description: 'Lorem Ipsum is simply dummy text of the printing ',
    bedRooms: 4,
    bathRooms: 2,
    garages: 2,
    sqFeet: 1.416,
    isFavorited: false,
    address: 'Rua A, N0,Bairro B',
  ),
  HouseData(
      image:
          "https://img.freepik.com/fotos-gratis/arquitetura-moderna-de-apartamentos_1268-14696.jpg?w=1380&t=st=1704563949~exp=1704564549~hmac=fc1479315a2b262d80a039bf07bf5366553156f02120efeaf43adba1476a6b6b",
      name: "Twin Villa",
      price: "320k",
      location: "Aracaju, Sergipe",
      description: '',
      bedRooms: 4,
      bathRooms: 2,
      garages: 2,
      sqFeet: 1.416,
      isFavorited: true,
      address: 'Rua A, N0,Bairro B',
      moreImagesUrl: [
        'https://media.istockphoto.com/id/1293762741/pt/foto/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=k-tUeeOObCH5eXkzesP6-jfMkJ2pnMIaU4YpclAjgAA=',
        'https://www.estilofontana.com.br/blog/wp-content/uploads/2021/02/Cozinha-Americana.jpg'
      ]),
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
    sqFeet: 1.416,
    isFavorited: false,
    address: 'Rua A, N0,Bairro B',
  ),
];

List<String> categoryList = [
  '<\$220.00',
  'Casas',
  '3-4 quartos',
  'Apartamentos',
];
