// import 'package:flutter/material.dart';
// import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
// import 'package:ache_um_lar/app/utils/data.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FavoritesPage extends StatefulWidget {
//   const FavoritesPage({Key? key}) : super(key: key);

//   @override
//   _FavoritesPageState createState() => _FavoritesPageState();
// }

// class _FavoritesPageState extends State<FavoritesPage> {
//   late SharedPreferences prefs;
//   late List<CardHomeModel> favoritesList =
//       []; // Inicializamos com uma lista vazia

//   @override
//   void initState() {
//     super.initState();
//     _loadFavorites();
//   }

//   Future<void> _loadFavorites() async {
//     prefs = await SharedPreferences.getInstance();
//     final favoriteIds = prefs.getStringList('favoriteIds') ?? [];
//     favoritesList = popular
//         .where((data) => favoriteIds.contains(data.id))
//         .map((data) => CardHomeModel(
//               id: data.id,
//               name: data.name,
//               urlImage: data.image,
//               city: data.location,
//               address: data.address ??
//                   '', // Corrigido: Adicionamos verificação de nulo
//               numberAddress: data.numberAddress
//                   .toString(), // Corrigido: Convertido para String
//               neighborhood: data.neighborhood ??
//                   '', // Corrigido: Adicionamos verificação de nulo
//               price: data.price.toString(), // Corrigido: Convertido para String
//               isFav: true,
//               description: data.description ??
//                   '', // Corrigido: Adicionamos verificação de nulo
//               bedRooms:
//                   data.bedRooms.toString(), // Corrigido: Convertido para String
//               bathRooms: data.bathRooms
//                   .toString(), // Corrigido: Convertido para String
//               garages:
//                   data.garages.toString(), // Corrigido: Convertido para String
//               sqFeet:
//                   data.sqFeet.toString(), // Corrigido: Convertido para String
//               iptu: data.iptu.toString(), // Corrigido: Convertido para String
//               condominiumTax: data.condominiumTax
//                   .toString(), // Corrigido: Convertido para String
//               category: data.category, // Adicionamos a categoria
//               moreImagesUrl: data.moreImagesUrl ?? [],
//             ))
//         .toList();
//     setState(() {});
//   }

//   Future<void> _toggleFavorite(CardHomeModel item) async {
//     item.toggleFavorite();
//     setState(() {});

//     final favoriteIds = favoritesList
//         .where((item) => item.isFav)
//         .map((item) => item.id)
//         .toList();
//     await prefs.setStringList('favoriteIds', favoriteIds);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: ListView.builder(
//         itemCount: favoritesList.length,
//         itemBuilder: (context, index) {
//           final item = favoritesList[index];
//           return ListTile(
//             leading: Image.network(
//               item.urlImage,
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//             ),
//             title: Text(item.name),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item.city),
//                 Text(
//                     'Category: ${item.category}'), // Adicionamos a categoria aqui
//               ],
//             ),
//             trailing: IconButton(
//               icon: Icon(
//                 item.isFav ? Icons.favorite : Icons.favorite_border,
//                 color: item.isFav ? Colors.red : Colors.grey,
//               ),
//               onPressed: () => _toggleFavorite(item),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
