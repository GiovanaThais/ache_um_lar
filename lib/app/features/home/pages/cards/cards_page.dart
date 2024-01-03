import 'package:ache_um_lar/app/core/widgets/home_app_bar_widget.dart';
import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final listCard = List<CardHomeModel>.generate(
      5,
      (index) => CardHomeModel(
          name: "Casa $index",
          urlImage:
              "https://img.freepik.com/fotos-gratis/villa-com-piscina-de-luxo-espetacular-design-contemporaneo-arte-digital-imoveis-casa-casa-e-propriedade-ge_1258-150749.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704153600&semt=sph"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            final item = listCard[index];
            return Card(
              child: Column(children: [
                ClipRRect(
                  child: Image.network(item.urlImage),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                Text(item.name),
              ]),
            );
          },
          separatorBuilder: ((context, index) => const SizedBox(
                height: 8,
              )),
          itemCount: listCard.length),
    );
  }
}
