import 'package:ache_um_lar/app/core/widgets/home_app_bar_widget.dart';
import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
import 'package:ache_um_lar/app/features/home/presenter/pages/datails_page.dart';
import 'package:flutter/material.dart';

import '../../../../utils/data.dart';
import '../widgets/categories_widget.dart';
import '../widgets/builld_search_bar_widget.dart';

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
            address: data.address,
            price: data.price,
            isFav: data.isFavorited,
            description: data.description,
            bedRooms: data.bedRooms,
            bathRooms: data.bathRooms,
            garages: data.garages,
            sqFeet: data.sqFeet,
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final iconSize = 20.0;

    return Column(
      children: [
        buildSearchBar(),
        const Categories(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = listCard[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsHouses(house: item),
                    ),
                  );
                },
                child: cardHousesMethod(item, textTheme, iconSize, theme),
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

  Card cardHousesMethod(CardHomeModel item, TextTheme textTheme,
      double iconSize, ThemeData theme) {
    double appPadding = 30.0;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(item.urlImage),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              Positioned(
                right: appPadding / 2,
                top: appPadding / 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(19)),
                  child: IconButton(
                    icon: item.isFav == true
                        ? const Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.black,
                          ),
                    onPressed: () {
                      setState(() {
                        item.isFav;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                item.name,
                style: textTheme.titleMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: iconSize,
                        ),
                        Text(
                          item.city,
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: iconSize,
                        ),
                        Text(
                          item.address,
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_money,
                      size: iconSize,
                    ),
                    Text(
                      item.price,
                      style: textTheme.headlineSmall
                          ?.copyWith(color: theme.colorScheme.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.bed),
                  ),
                  Text('2')
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.bathtub),
                  ),
                  Text('2')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
