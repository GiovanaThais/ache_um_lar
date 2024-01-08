import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.95);
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.90, size.width / 2, size.height * 0.95);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height, size.width, size.height * 0.95);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
