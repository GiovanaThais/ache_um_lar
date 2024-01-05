class HouseData {
  final String image;
  final String name;
  final String price;
  final String location;
  final bool isFavorited;

  HouseData({
    required this.image,
    required this.name,
    required this.price,
    required this.location,
    required this.isFavorited,
  });
}

List<HouseData> popular = [
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/casa-isolada-no-campo_1303-23773.jpg?w=1380&t=st=1704481312~exp=1704481912~hmac=8240a7ef554fde5e37f1bfcf1dae2e8195607d0475af88482b1c9ae994c8a5e6",
    name: "Single Villa",
    price: "\$280k",
    location: "Aracaju, Sergipe",
    isFavorited: true,
  ),
  HouseData(
    image:
        "https://casacor.abril.com.br/wp-content/uploads/sites/7/2022/01/Casa-Liu-Raiz-Arquitetura-Foto-Leonardo-Giantomasi-2.jpg?quality=90&strip=info",
    name: "Convertible Studio",
    price: "\$250k",
    location: "Aracaju, Sergipe",
    isFavorited: false,
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/villa-com-piscina-de-luxo-espetacular-design-contemporaneo-arte-digital-imoveis-casa-casa-e-propriedade-ge_1258-150749.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704153600&semt=sph",
    name: "Twin Castle",
    price: "\$275k",
    location: "Aracaju, Sergipe",
    isFavorited: false,
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/design-house-villa-moderna-com-sala-de-estar-em-plano-aberto-e-ala-de-quarto-privado-grande-terraco-com-privacidade_1258-169741.jpg?w=1380&t=st=1704481261~exp=1704481861~hmac=9f26e41c8852c8e38d4e82af0c56a183173796c5f40f90ae44056ec5f97af6f4",
    name: "Garden Villa",
    price: "\$320k",
    location: "Aracaju, Sergipe",
    isFavorited: false,
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/arquitetura-moderna-de-apartamentos_1268-14696.jpg?w=1380&t=st=1704481697~exp=1704482297~hmac=8ba2aa899acae53028d92acf0315ea19ea2f352f13c58b965a73ae462b7b2781",
    name: "Twin Villa",
    price: "\$320k",
    location: "Aracaju, Sergipe",
    isFavorited: false,
  ),
  HouseData(
    image:
        "https://img.freepik.com/fotos-gratis/aconchegante-sala-de-estar-de-um-apartamento-moderno_181624-58445.jpg?w=1380&t=st=1704481813~exp=1704482413~hmac=f1099bc0732e1881578e397686cbf4a8744bc23f77cc66a77c82e16c749a449a",
    name: "Twin Villa",
    price: "\$320k",
    location: "Aracaju, Sergipe",
    isFavorited: false,
  ),
];
