import 'package:ache_um_lar/app/utils/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
import 'package:ache_um_lar/app/features/home/presenter/widgets/datails_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../presenter/widgets/builld_search_bar_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<CardHomeModel> listCard = [];
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList('favoriteIds') ?? [];
    listCard = popular
        .map((data) => CardHomeModel(
              id: data.id,
              name: data.name,
              urlImage: data.image,
              city: data.location,
              address: data.address,
              numberAddress: data.numberAddress,
              neighborhood: data.neighborhood,
              price: data.price,
              isFav: favoriteIds.contains(data.id),
              description: data.description,
              bedRooms: data.bedRooms,
              bathRooms: data.bathRooms,
              garages: data.garages,
              sqFeet: data.sqFeet,
              iptu: data.iptu,
              condominiumTax: data.condominiumTax,
              moreImagesUrl: data.moreImagesUrl ?? [],
            ))
        .where((element) => element.isFav)
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    const iconSize = 20.0;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        buildSearchBar(context),
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
                child: SizedBox(
                  height: size.height * 0.4,
                  child: cardHousesMethod(item, textTheme, iconSize, theme),
                ),
              );
            },
            separatorBuilder: ((context, index) => const SizedBox(height: 8)),
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
          Expanded(
            flex: 60,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.network(
                    item.urlImage,
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,
                  ),
                ),
                Positioned(
                  right: appPadding / 2,
                  top: appPadding / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: IconButton(
                      icon: item.isFav
                          ? const Icon(Icons.favorite_rounded,
                              color: Colors.red)
                          : const Icon(Icons.favorite_border_rounded,
                              color: Colors.black),
                      onPressed: () {
                        // No need to toggle favorite in FavoritesPage
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 40,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 8.0),
                        child: Text(item.name, style: textTheme.headlineSmall),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, size: iconSize),
                          const SizedBox(width: 2),
                          Text(item.city, style: textTheme.titleMedium),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, size: iconSize),
                          const SizedBox(width: 2),
                          Text(
                              '${item.address} ${item.numberAddress} ${item.neighborhood}',
                              style: textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.bed),
                                ),
                              ],
                            ),
                            Text(item.bedRooms),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.bathtub),
                                ),
                              ],
                            ),
                            Text(item.bathRooms),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Icon(FontAwesomeIcons.brazilianRealSign,
                                size: iconSize * 0.8,
                                color: theme.colorScheme.primary),
                            const SizedBox(width: 2),
                            Text(item.price,
                                style: textTheme.displaySmall?.copyWith(
                                    color: theme.colorScheme.primary)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
