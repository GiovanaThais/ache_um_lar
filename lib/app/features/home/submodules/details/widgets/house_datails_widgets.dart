import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/constants_widget.dart';

class HouseDetailsWidget extends StatefulWidget {
  final CardHomeModel house;
  const HouseDetailsWidget(this.house, {super.key});

  @override
  State<HouseDetailsWidget> createState() => _HouseDetailsWidgetState();
}

class _HouseDetailsWidgetState extends State<HouseDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: appPadding,
              left: appPadding,
              right: appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${widget.house.price}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.house.address,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'IPTU: \$${widget.house.iptu} reais',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Condomínio: \$${widget.house.condominiumTax} reais',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    '${widget.house.city} ',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: appPadding, bottom: appPadding),
            child: Text(
              'Mais informações',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.square_foot,
                          size: 24,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.house.sqFeet} Metros²',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.king_bed,
                          size: 24,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.house.bedRooms} Quartos',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.bathtub,
                          size: 24,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.house.bathRooms} Banheiros',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.garage,
                          size: 24,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.house.garages} Garagem',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.pool,
                          size: 24,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.house.garages} Lazer',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: appPadding,
              right: appPadding,
              bottom: appPadding * 4,
            ),
            child: Text(
              widget.house.description,
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
