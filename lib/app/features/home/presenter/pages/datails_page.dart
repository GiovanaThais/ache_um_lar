import 'package:ache_um_lar/app/features/home/models/card_home_model.dart';
import 'package:ache_um_lar/app/features/home/submodules/details/widgets/bottom_buttons.dart';
import 'package:ache_um_lar/app/features/home/submodules/details/widgets/custom_bar_widgtes.dart';
import 'package:flutter/material.dart';

import '../../submodules/details/widgets/carousel_images_widgets.dart';
import '../../submodules/details/widgets/house_datails_widgets.dart';

class DetailsHouses extends StatefulWidget {
  final CardHomeModel house;
  const DetailsHouses({super.key, required this.house});

  @override
  State<DetailsHouses> createState() => _DetailsHousesState();
}

class _DetailsHousesState extends State<DetailsHouses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              const Stack(
                children: [
                  CustomAppBarWidget(),
                ],
              ),
              CarouselImageWidget(
                imagesListUrl: widget.house.moreImagesUrl ?? [],
              ),
              HouseDetailsWidget(widget.house),
            ],
          ),
          const BottomButtons(),
        ],
      ),
    );
  }
}
