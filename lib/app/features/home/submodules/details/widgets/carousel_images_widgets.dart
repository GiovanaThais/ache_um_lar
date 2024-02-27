import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'package:photo_view/photo_view_gallery.dart';

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

    return GestureDetector(
      onTap: () {
        _openImageGallery(context);
      },
      child: Container(
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
      ),
    );
  }

  Widget _buildImageCarousel(Size size) {
    return PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(widget.imagesListUrl[index]),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
        );
      },
      itemCount: widget.imagesListUrl.length,
      pageController: PageController(),
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
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

  void _openImageGallery(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.black,
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider:
                            NetworkImage(widget.imagesListUrl[index]),
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        maxScale: PhotoViewComputedScale.covered * 2,
                      );
                    },
                    itemCount: widget.imagesListUrl.length,
                    backgroundDecoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    pageController: PageController(initialPage: _currentIndex),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 161, 0, 189),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
