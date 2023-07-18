import 'dart:ui';

import 'package:flutter/material.dart';

class Glass extends StatelessWidget {
  final double height;
  final double width;
  final double opacity;
  final double blur;
  final Widget child;
  const Glass(
      {super.key,
      required this.height,
      required this.width,
      required this.opacity,
      required this.blur,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: blur, sigmaX: blur),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(color: Colors.black.withOpacity(opacity)),
            child: child,
          )),
    );
  }
}
