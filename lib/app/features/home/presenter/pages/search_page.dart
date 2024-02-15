import 'package:flutter/material.dart';

import '../../../../utils/data.dart';

class SearchPage extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'ex: nome,valor ou cidade';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder<HouseData>(
        future: result(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Image.network(snapshot.data!.image),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data!.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(snapshot.data!.price)
                        ],
                      ),
                      Text(snapshot.data!.location),
                      Text(snapshot.data!.address),
                    ],
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("erro ao captar produto"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder<List<HouseData>>(
        future: suggestion(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(snapshot.data![index].image),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].location),
                    trailing: Text(snapshot.data![index].price),
                    onTap: () {
                      query = snapshot.data![index].name.toString();
                      showResults(context);
                    },
                  );
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao pesquisar produto'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List<HouseData>> suggestion() async {
    // Simule uma operação assíncrona que busca dados do arquivo data.dart
    await Future.delayed(Duration(seconds: 1));
    var filteredHouses = popular.where((house) {
      return house.name.toLowerCase().contains(query.toLowerCase()) ||
          house.price.toLowerCase().contains(query.toLowerCase()) ||
          house.location.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return filteredHouses;
  }

  Future<HouseData> result(String name) async {
    // Simule uma operação assíncrona que busca dados do arquivo data.dart
    await Future.delayed(Duration(seconds: 1));
    var house = popular.firstWhere((house) => house.name == name);
    return house;
  }
}
