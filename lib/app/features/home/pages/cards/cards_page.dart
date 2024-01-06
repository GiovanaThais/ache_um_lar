import 'package:ache_um_lar/app/core/widgets/home_app_bar_widget.dart';
import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/data.dart';
import '../../components/categories.dart';
import 'widgets/builld_search_bar_widget.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final listCard = popular
      .map((data) => CardHomeModel(
            name: data.name,
            urlImage: data.image,
            city: data.location,
            address: '',
            price: data.price,
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSearchBar(),
        const Categories(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = listCard[index];
              return Card(
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.network(item.urlImage),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    Text(item.name),
                    Text(item.city),
                    Text(item.address),
                    Text(item.price),
                  ],
                ),
              );
            },
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 8,
                )),
            itemCount: listCard.length,
          ),
        ),
      ],
    );
  }
}
