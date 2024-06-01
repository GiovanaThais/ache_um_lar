// import 'package:flutter/material.dart';
// import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';

// class DetailsHouses extends StatelessWidget {
//   final CardHomeModel house;

//   const DetailsHouses({Key? key, required this.house}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final textTheme = theme.textTheme;
//     final size = MediaQuery.of(context).size;
//     final iconSize = 20.0;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(house.name),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: size.height * 0.4,
//               child: PageView(
//                 children: house.moreImagesUrl.isEmpty
//                     ? [
//                         Image.asset(
//                           'assets/icons/logo3.jpeg', // Imagem de placeholder
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         ),
//                       ]
//                     : house.moreImagesUrl.map((url) {
//                         return url.isNotEmpty
//                             ? Image.network(
//                                 url,
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                               )
//                             : Image.asset(
//                                 'assets/icons/logo3.jpeg', // Imagem de placeholder
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                               );
//                       }).toList(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(house.name, style: textTheme.bodySmall),
//                   SizedBox(height: 8.0),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on, size: iconSize),
//                       SizedBox(width: 4.0),
//                       Text('${house.address}, ${house.numberAddress}',
//                           style: textTheme.bodySmall),
//                     ],
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(house.description, style: textTheme.bodyMedium),
//                   SizedBox(height: 16.0),
//                   Text('Características', style: textTheme.bodySmall),
//                   SizedBox(height: 8.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
//                           Icon(Icons.bed, size: iconSize),
//                           Text('${house.bedRooms} Quartos',
//                               style: textTheme.bodySmall),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Icon(Icons.bathtub, size: iconSize),
//                           Text('${house.bathRooms} Banheiros',
//                               style: textTheme.bodySmall),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Icon(Icons.car_repair, size: iconSize),
//                           Text('${house.garages} Garagens',
//                               style: textTheme.bodySmall),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Icon(Icons.square_foot, size: iconSize),
//                           Text('${house.sqFeet} m²',
//                               style: textTheme.bodySmall),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16.0),
//                   Text('Valores', style: textTheme.bodyMedium),
//                   SizedBox(height: 8.0),
//                   Text('Preço: R\$ ${house.price}',
//                       style: textTheme.bodyMedium),
//                   Text('IPTU: R\$ ${house.iptu}', style: textTheme.bodySmall),
//                   Text('Condomínio: R\$ ${house.condominiumTax}',
//                       style: textTheme.bodySmall),
//                   SizedBox(height: 16.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           // Lógica para agendar uma visita
//                         },
//                         child: Text('Agendar Visita'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Lógica para entrar em contato
//                         },
//                         child: Text('Entrar em Contato'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
