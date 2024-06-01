// import 'package:ache_um_lar/app/features/home/models/card_model.dart';
// import 'package:ache_um_lar/app/features/home/presenter/pages/datails_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../../../auth/service/property_service.dart';

// import '../widgets/builld_search_bar_widget.dart';
// import '../widgets/categories_widget.dart';

// class CardPage extends StatefulWidget {
//   const CardPage({super.key});

//   @override
//   State<CardPage> createState() => _CardPageState();
// }

// class _CardPageState extends State<CardPage> {
//   final PropertyService _propertyService = PropertyService();
//   late Future<List<CardHomeModel>> _propertiesFuture;
//   late List<CardHomeModel> listCard = [];
//   late SharedPreferences prefs;
//   String selectedCategory = 'All';

//   @override
//   void initState() {
//     super.initState();
//     _propertiesFuture = _loadData();
//   }

//   Future<void> _loadFavorites() async {
//     prefs = await SharedPreferences.getInstance();
//     final favoriteIds = prefs.getStringList('favoriteIds') ?? [];
//     setState(() {
//       listCard = favoriteIds
//           .map((id) => CardModel(
//                 id: id,
//                 name: '',
//                 urlImage: '',
//                 city: '',
//                 address: '',
//                 numberAddress: '',
//                 neighborhood: '',
//                 price: '',
//                 isFav: true,
//                 description: '',
//                 bedRooms: '',
//                 bathRooms: '',
//                 garages: '',
//                 sqFeet: '',
//                 iptu: '',
//                 condominiumTax: '',
//                 moreImagesUrl: [],
//                 category: '',
//               ))
//           .toList();
//     });
//   }

//   Future<List<CardHomeModel>> _loadData() async {
//     await _loadFavorites();
//     return _propertyService.getProperties();
//   }

//   void _filterList() {
//     if (selectedCategory == 'All') {
//       setState(() {
//         listCard =
//             listCard; // Aqui você pode filtrar de acordo com os dados carregados
//       });
//     } else {
//       setState(() {
//         listCard = listCard
//             .where((data) => data.category == selectedCategory)
//             .toList();
//       });
//     }
//   }

//   void _onCategorySelected(String category) {
//     setState(() {
//       selectedCategory = category;
//       _filterList();
//     });
//   }

//   Future<void> _toggleFavorite(CardHomeModel item) async {
//     item.toggleFavorite();
//     setState(() {});

//     final favoriteIds =
//         listCard.where((item) => item.isFav).map((item) => item.id).toList();
//     await prefs.setStringList('favoriteIds', favoriteIds);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final textTheme = theme.textTheme;
//     const iconSize = 20.0;
//     final size = MediaQuery.of(context).size;

//     return FutureBuilder<List<CardHomeModel>>(
//       future: _propertiesFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Erro ao carregar imóveis'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('Nenhum imóvel encontrado'));
//         } else {
//           final properties = snapshot.data!;
//           return Column(
//             children: [
//               buildSearchBar(context),
//               Categories(onCategorySelected: _onCategorySelected),
//               Expanded(
//                 child: ListView.separated(
//                   itemBuilder: (context, index) {
//                     final item = properties[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => DetailsHouses(house: item),
//                           ),
//                         );
//                       },
//                       child: SizedBox(
//                         height: size.height * 0.4,
//                         child:
//                             cardHousesMethod(item, textTheme, iconSize, theme),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(height: 8),
//                   itemCount: properties.length,
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }

//   Card cardHousesMethod(CardHomeModel item, TextTheme textTheme,
//       double iconSize, ThemeData theme) {
//     double appPadding = 30.0;

//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             flex: 60,
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(8)),
//                   child: item.urlImage.isNotEmpty
//                       ? Image.network(
//                           item.urlImage,
//                           fit: BoxFit.fitWidth,
//                           width: double.maxFinite,
//                         )
//                       : Image.asset(
//                           'assets/icons/logo3.jpeg', // Use um placeholder para quando a URL estiver vazia
//                           fit: BoxFit.fitWidth,
//                           width: double.maxFinite,
//                         ),
//                 ),
//                 Positioned(
//                   right: appPadding / 2,
//                   top: appPadding / 2,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(19),
//                     ),
//                     child: IconButton(
//                       icon: item.isFav
//                           ? const Icon(Icons.favorite_rounded,
//                               color: Colors.red)
//                           : const Icon(Icons.favorite_border_rounded,
//                               color: Colors.black),
//                       onPressed: () {
//                         _toggleFavorite(item);
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 40,
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 0.0, vertical: 8.0),
//                         child: Text(item.name, style: textTheme.headlineSmall),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.location_on, size: iconSize),
//                           const SizedBox(width: 2),
//                           Text(item.city, style: textTheme.titleMedium),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.home, size: iconSize),
//                           const SizedBox(width: 2),
//                           Text(
//                               '${item.address} ${item.numberAddress} ${item.neighborhood}',
//                               style: textTheme.titleMedium),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Icon(FontAwesomeIcons.bed, size: iconSize),
//                             Text(item.bedRooms, style: textTheme.bodyLarge),
//                             Icon(FontAwesomeIcons.bath, size: iconSize),
//                             Text(item.bathRooms, style: textTheme.bodyLarge),
//                             Icon(FontAwesomeIcons.car, size: iconSize),
//                             Text(item.garages, style: textTheme.bodyLarge),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('R\$${item.price}',
//                               style: textTheme.headlineSmall!
//                                   .copyWith(color: theme.colorScheme.primary)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
