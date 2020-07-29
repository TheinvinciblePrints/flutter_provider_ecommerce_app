import 'package:flutter/material.dart';

class PageThreeClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height * .5);
    path.quadraticBezierTo(
        size.width, size.height * .5, size.width, size.height * .6);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
