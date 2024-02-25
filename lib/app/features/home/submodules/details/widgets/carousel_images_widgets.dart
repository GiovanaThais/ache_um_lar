import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';

class CarouselImageWidget extends StatefulWidget {
  final List<String> imagesListUrl;

  const CarouselImageWidget({Key? key, required this.imagesListUrl})
      : super(key: key);

  @override
  State<CarouselImageWidget> createState() => _CarouselImageWidgetState();
}

class _CarouselImageWidgetState extends State<CarouselImageWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    print("widget.imagesListUrl" + widget.imagesListUrl.toString());
    return Container(
      height: size.height * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 85,
            child: _buildImageCarousel(size),
          ),
          Expanded(
            flex: 15,
            child: _buildIndicatorDots(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel(Size size) {
    log("widget.imagesListUrl" + widget.imagesListUrl.toString());
    return carousel.CarouselSlider(
      options: carousel.CarouselOptions(
        height: size.height * 0.35,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: widget.imagesListUrl.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildIndicatorDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.imagesListUrl.map((url) {
        int index = widget.imagesListUrl.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 2.0,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
        );
      }).toList(),
    );
  }
}
